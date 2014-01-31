//
//  PersonDetailsVC.m
//  pedigree
//
//  Created by  Madhavi Tammineni on 1/23/14.
//  Copyright (c) 2014 CDC Informatics R&D Lab. All rights reserved.
//

#import "PersonDetailsVC.h"
#import "Person.h"
#import "PersonalInfoTVC.h"
#import "HealthInfoTVC.h"
#import "FamilyBackgroundTVC.h"
#import "RelativesTableVC.h"

@interface PersonDetailsVC ()

@property (weak, nonatomic) IBOutlet UIView *personalInfoView;
@property (weak, nonatomic) IBOutlet UIView *healthInfoView;
@property (weak, nonatomic) IBOutlet UIView *familyBackgroundView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segControl;

@property (weak, nonatomic) IBOutlet UITextField *txtFirstName;
@property (weak, nonatomic) IBOutlet UITextField *txtLastName;

- (IBAction)segControlValueChange:(id)sender;
- (IBAction)editPersonalInfo:(id)sender;

@end

PersonalInfoTVC *personalInfoTVC;
HealthInfoTVC *healthInfoTVC;
FamilyBackgroundTVC *familyBackgroundTVC;

RelativesTableVC *relativesTVC;

BOOL editMode = NO;

@implementation PersonDetailsVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.navigationItem.hidesBackButton = YES;
    [self.txtFirstName setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
    [self.txtLastName setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
    
    _segControl.selectedSegmentIndex = 0;
    self.personalInfoView.hidden = NO;
    self.healthInfoView.hidden = YES;
    self.familyBackgroundView.hidden = YES;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)segControlValueChange:(id)sender {
    
    if (_segControl.selectedSegmentIndex == 0) {
        self.personalInfoView.hidden = NO;
        self.healthInfoView.hidden = YES;
        self.familyBackgroundView.hidden = YES;
        
    } else if (_segControl.selectedSegmentIndex == 1) {
        self.personalInfoView.hidden = YES;
        self.healthInfoView.hidden = NO;
        self.familyBackgroundView.hidden = YES;
    
    }else if (_segControl.selectedSegmentIndex == 2) {
        self.personalInfoView.hidden = YES;
        self.healthInfoView.hidden = YES;
        self.familyBackgroundView.hidden = NO;
    }

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
     DebugLog(@"The Segue name is: %@", segue.identifier);
    
    if([segue.identifier isEqualToString:@"embedPersonalInfoTV"])
    {
        personalInfoTVC = (PersonalInfoTVC *)segue.destinationViewController;
        personalInfoTVC.relative = self.me;
    }
  /*  if([segue.identifier isEqualToString:@"embedHealthInfoTV"])
    {
        healthInfoTVC = (HealthInfoTVC *)segue.destinationViewController;
        healthInfoTVC.relative = self.me;
    }*/
    if([segue.identifier isEqualToString:@"embedHealthInfoTV"])
    {
        healthInfoTVC = (HealthInfoTVC *)segue.destinationViewController;
        healthInfoTVC.relative = self.me;
    }
    if([segue.identifier isEqualToString:@"showRelativesTV"])
    {
        DebugLog(@"show Relatives");
        relativesTVC = (RelativesTableVC *)segue.destinationViewController;
        //relativesTVC.relative = self.me;
    }


}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

/*
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
 

-(BOOL) textFieldShouldBeginEditing:(UITextField *)textField
{
    return YES;
}

-(BOOL)textFieldShouldClear:(UITextField *)textField{
    return YES;
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    return YES;
}
 */

- (IBAction)editPersonalInfo:(id)sender
{
   // [self setEditing:YES animated:YES];
}

@end
