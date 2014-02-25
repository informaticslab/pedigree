//
//  FamilyBackgroundTVC.m
//  pedigree
//
//  Created by Madhavi Tammineni on 2/3/14.
//  Copyright (c) 2014 CDC Informatics R&D Lab. All rights reserved.
//

#import "FamilyBackgroundTVC.h"
#import "SelectRaceVC.h"
#import "SelectEthnicityVC.h"
#import "Relative.h"

@interface FamilyBackgroundTVC ()

@end

@implementation FamilyBackgroundTVC

@synthesize relative;
@synthesize lblParentsRelationship;
@synthesize lblRace;
@synthesize lblEthnicity;

@synthesize areParentsRelatedOtherThanMarriage;
@synthesize selectedRaces;
@synthesize selectedEthnicities;

SelectRaceVC *selectRaceVC;
SelectEthnicityVC *selectEthnicityVC;

NSArray *arrBoolean;

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
    
    arrBoolean = [[NSArray alloc] initWithObjects:@"Yes", @"No", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
 */

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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
            [self displayParentRelationshipPicker];
            break;
        default:
            break;
    }
}

-(void)displayParentRelationshipPicker{
    
    UIActionSheet *asParentRelationshipView = [[UIActionSheet alloc] initWithTitle:@"Are your parents related to each other in any way other than marriage?" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Yes", @"No", nil];
    
    asParentRelationshipView.tag = 0;
    [asParentRelationshipView setBounds:CGRectMake(0, 0, 320, 500)];
    
    [asParentRelationshipView showInView:self.view];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    
    switch (actionSheet.tag) {
        case 0:
        {
            if (buttonIndex == 0) {
                areParentsRelatedOtherThanMarriage = YES;
                lblParentsRelationship.text = [arrBoolean objectAtIndex:buttonIndex];
            }
            else if (buttonIndex == 1) {
                areParentsRelatedOtherThanMarriage = NO;
                lblParentsRelationship.text = [arrBoolean objectAtIndex:buttonIndex];
            }
            else{
               areParentsRelatedOtherThanMarriage = NO;
               lblParentsRelationship.text = @"";
            }
            break;
        }
        default:
        break;
    }
}

- (IBAction)dismissWithDoneSelectRaceVC:(UIStoryboardSegue *)segue {
    
    selectRaceVC = segue.sourceViewController;
    lblRace.text = [[selectRaceVC.setSelectedRaces allObjects] componentsJoinedByString:@","];
    selectedRaces = selectRaceVC._checkboxSelections;
    [selectRaceVC dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)dismissWithCancelSelectRaceVC:(UIStoryboardSegue *)segue {
   
    selectRaceVC = segue.sourceViewController;
    [selectRaceVC dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)dismissWithDoneSelectEthnicityVC:(UIStoryboardSegue *)segue {
    
    selectEthnicityVC = segue.sourceViewController;
    lblEthnicity.text = [[selectEthnicityVC.setSelectedEthnicities allObjects] componentsJoinedByString:@","];
    selectedEthnicities = selectEthnicityVC._checkboxSelections;
    [selectEthnicityVC dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)dismissWithCancelSelectEthnicityVC:(UIStoryboardSegue *)segue {
    
    selectEthnicityVC = segue.sourceViewController;
    [selectEthnicityVC dismissViewControllerAnimated:YES completion:nil];
}

-(void)displayRelativeData:(Relative *)currRelative
{
    if (currRelative.areParentsRelatedOtherThanMarraige.boolValue == YES) {
        lblParentsRelationship.text = @"Yes";
    }
    else if (currRelative.areParentsRelatedOtherThanMarraige.boolValue == NO) {
        lblParentsRelationship.text = @"No";
    }
}

@end
