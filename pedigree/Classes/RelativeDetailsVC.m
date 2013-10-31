//
//  RelativeDetailsVC.m
//  pedigree
//
//  Created by jtq6 on 9/26/13.
//  Copyright (c) 2013 CDC Informatics R&D Lab. All rights reserved.
//

#import "RelativeDetailsVC.h"
#import "PersonalInfoTVC.h"
#import "HealthInfoTVC.h"

PersonalInfoTVC *personalInfoTVC;
HealthInfoTVC *healthInfoTVC;

BOOL editMode;

@implementation RelativeDetailsVC


- (void)viewDidLoad
{
    [super viewDidLoad];
    editMode = NO;
	// Do any additional setup after loading the view.
    _txtFirstName.text = _relative.firstName;
    _txtLastName.text = _relative.lastName;
    //detailsTVC.lblAdopted.text = _relative.
    self.navigationItem.rightBarButtonItem = [self editButtonItem];
    self.personalInfoView.hidden = NO;
    self.healthInforView.hidden = YES;
    self.segControl.selectedSegmentIndex = 0;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"embedRelativeDetailsTableView"])
    {
        personalInfoTVC = (PersonalInfoTVC *)segue.destinationViewController;
        personalInfoTVC.relative = _relative;
        
    } else if ([segue.identifier isEqual:@"embedHealthInfoTableView"]) {
        healthInfoTVC = (HealthInfoTVC *)segue.destinationViewController;
        healthInfoTVC.relative = _relative;
        
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if ((textField == _txtFirstName) || (textField == _txtLastName)) {
        [textField resignFirstResponder];
    }
    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    if (self.editing)
        return YES;
    else
        return NO;
    
}


- (void)setEditing:(BOOL)flag animated:(BOOL)animated
{
    [super setEditing:flag animated:animated];
//    [detailsTVC setEditing:flag animated:animated];

    if (flag == YES) {
        // change view to edit mode
    
    }
    else {
        // Save the changes if needed and change the views to noneditable.
        [self.view endEditing:YES];

    }
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}

- (IBAction)segControlValueChange:(id)sender {
    
    if (_segControl.selectedSegmentIndex == 0) {
        self.personalInfoView.hidden = NO;
        self.healthInforView.hidden = YES;

    } else if (_segControl.selectedSegmentIndex == 1) {
        self.personalInfoView.hidden = YES;
        self.healthInforView.hidden = NO;
    }
}
@end
