//
//  RelativeDetailsTableVC.m
//  pedigree
//
//  Created by jtq6 on 10/21/13.
//  Copyright (c) 2013 CDC Informatics R&D Lab. All rights reserved.
//

#import "PersonalInfoTVC.h"
#import "SelectBirthdateVC.h"

@implementation PersonalInfoTVC

@synthesize lblRelationship;
@synthesize lblGender;
@synthesize selectRelationshipTVC;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
  //  _lblRelationship.text = _relative.relationDescription;
    
    [_switchLiving addTarget:self action:@selector(switchValueChanged:) forControlEvents:UIControlEventValueChanged];
    [_switchTwin addTarget:self action:@selector(switchValueChanged:) forControlEvents:UIControlEventValueChanged];
    [_switchIdenticalTwin addTarget:self action:@selector(switchValueChanged:) forControlEvents:UIControlEventValueChanged];
    [_switchAdopted addTarget:self action:@selector(switchValueChanged:) forControlEvents:UIControlEventValueChanged];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dismissWithDoneBirthdateVC:(UIStoryboardSegue *)segue {
    SelectBirthdateVC *birthdateVC = segue.sourceViewController;
    
    NSDate *date = [birthdateVC.datePicker date];
    NSLocale *usLocale = [[NSLocale alloc]
                          initWithLocaleIdentifier:@"en_US"];
    self.lblBirthdate.text = [[NSString alloc]
                         initWithFormat:@"%@",
                         [date descriptionWithLocale:usLocale]];

    [self dismissViewControllerAnimated:YES completion:nil];
    [self.tableView reloadData];

}

- (IBAction)dismissWithCancelBirthdateVC:(UIStoryboardSegue *)segue {
    SelectBirthdateVC *birthdateVC = segue.sourceViewController;
    [birthdateVC dismissViewControllerAnimated:YES completion:nil];

}

- (IBAction)dismissWithDoneRelationshipVC:(UIStoryboardSegue *)segue {
    SelectRelationshipVC *relationshipVC = segue.sourceViewController;
    self.lblRelationship.text = relationshipVC.relDescription;
    [relationshipVC dismissViewControllerAnimated:YES completion:nil];
    [self.tableView reloadData];
    
}


- (IBAction)dismissWithCancelRelationshipVC:(UIStoryboardSegue *)segue {
    SelectRelationshipVC *relationshipVC = segue.sourceViewController;
    [relationshipVC dismissViewControllerAnimated:YES completion:nil];
    
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"showSelectRelationship"])
    {
        selectRelationshipTVC = segue.destinationViewController;
        selectRelationshipTVC.relative = _relative;
    }
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

- (void)switchValueChanged:(id)sender{

    if([sender tag] == 0){
        if ([sender isOn]) {
            _relative.isLiving = [NSNumber numberWithBool:YES];
        }
        else{
            _relative.isLiving = [NSNumber numberWithBool:NO];
        }
        
    }
    else if ([sender tag] == 1){
        if ([sender isOn]) {
            _relative.isTwin = [NSNumber numberWithBool:YES];
        }
        else{
            _relative.isTwin = [NSNumber numberWithBool:NO];
        }
    }
    else if ([sender tag] == 2){
        if ([sender isOn]) {
            _relative.isIdenticalTwin = [NSNumber numberWithBool:YES];
        }
        else{
            _relative.isIdenticalTwin = [NSNumber numberWithBool:NO];
        }
    }
    else if ([sender tag] == 3){
        if ([sender isOn]) {
            _relative.isAdopted = [NSNumber numberWithBool:YES];
        }
        else{
            _relative.isAdopted = [NSNumber numberWithBool:NO];
        }
        
    }
    else{
        // do nothing
    }
    
}



@end
