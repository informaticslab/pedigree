//
//  FamilyMembersVC.m
//  pedigree
//
//  Created by jtq6 on 3/21/13.
//  Copyright (c) 2013 CDC Informatics R&D Lab. All rights reserved.
//

#import "RelativesTableVC.h"
#import "AppManager.h"
#import "Relative.h"
#import "FamilyTree.h"
#import "Person.h"
#import "RelativeDetailsVC.h"
#import "PersonDetailsVC.h"
#import "SelectRelationshipVC.h"

@interface RelativesTableVC ()

@property (nonatomic, weak) Relative *me;
@property (nonatomic, strong) PersonDetailsVC *personDetailsVC;
//@property (nonatomic, weak) NSString *relationToBeAdded;
@property (nonatomic) NSInteger selectedRelationId;

@end

@implementation RelativesTableVC

@synthesize personDetailsVC;
@synthesize tblView;

AppManager *appMgr;
FamilyTree *famTree;
Relative *currRelative;

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.navigationItem.hidesBackButton = YES;

    // load application manager
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"Relative" inManagedObjectContext:APP_MGR.managedObjectContext];
    [fetchRequest setEntity:entity];
    self.relatives = [APP_MGR getAllPeople];
    self.title = @"Family";
    
  //  self.tabBarController.tabBar.hidden = YES;
}

-(void)viewWillAppear:(BOOL)animated
{
    [self loadRelatives];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [_relatives count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"FamilyMemberCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    NSInteger index = [indexPath row];
    currRelative = (Relative *)[_relatives objectAtIndex:index];
    
    
  //  cell.textLabel.text = currRelative.relationDescription;
    cell.textLabel.text = @"";
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ %@", currRelative.firstName, currRelative.lastName];
    
 /*   //temporarily displaying the diseases that are added to the user's profile
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:[NSEntityDescription entityForName:@"ContractedDisease" inManagedObjectContext:APP_MGR.managedObjectContext]];
    NSError *error = nil;
    NSArray *results = [APP_MGR.managedObjectContext executeFetchRequest:request error:&error];
    
    if (error)
    {
        DebugLog(@"Problem retrieving the relative's diseases %@", error);
    }
   
    NSLog(@"The total number of diseases the user has are: %d", [results count]);
    if (results != NULL) {
        NSLog(@"Disease name: %@", [[results objectAtIndex:0] name]);
        NSLog(@"Disease category name: %@", [[results objectAtIndex:0] categoryName]);
        NSLog(@"Age of diagnosis: %d", [[[results objectAtIndex:0] ageAtDiagnosis] integerValue]);
    }
  */
    
    NSLog(@"The total number of diseases the user has are: %d", [currRelative.contractedDisease count]);

    return cell;
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

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  /*temporarily disabling...until the next view is cleaned 
   // Navigation logic may go here. Create and push another view controller.
    // [self.navigationController pushViewController:detailViewController animated:YES];
     [self performSegueWithIdentifier:@"showRelativeDetailsSegue" sender:nil];
   */
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
  /*  if([segue.identifier isEqualToString:@"showRelativeDetailsSegue"])
    {
        RelativeDetailsVC *relativeDetailsVC = segue.destinationViewController;
        relativeDetailsVC.relative = currRelative;
    }
   */
    if([segue.identifier isEqualToString:@"showPersonSegue"])
    {
        personDetailsVC = (PersonDetailsVC *)[segue.destinationViewController topViewController];
        personDetailsVC.selectedRelationId = _selectedRelationId;
    }
}

- (IBAction)dismissWithDoneRelationshipVC:(UIStoryboardSegue *)segue {
    SelectRelationshipVC *relationshipVC = segue.sourceViewController;
   _selectedRelationId = relationshipVC._selectedIndex;
    
    if (relationshipVC._selectedIndex < 0) {
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Missing Data" message:@"Please select a relationship to add a relative" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alertView show];
    }
    else{
       
        [relationshipVC dismissViewControllerAnimated:YES completion:nil];
        [self performSegueWithIdentifier:@"showPersonSegue" sender:self];
    }
}

- (IBAction)dismissWithCancelPersonVC:(UIStoryboardSegue *)segue {
    personDetailsVC = segue.sourceViewController;
    [personDetailsVC dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)dismissWithDoneAddingPersonVC:(UIStoryboardSegue *)segue {
    personDetailsVC = segue.sourceViewController;
    [personDetailsVC dismissViewControllerAnimated:YES completion:nil];
}

-(void)loadRelatives{
    
    // load application manager
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"Relative" inManagedObjectContext:APP_MGR.managedObjectContext];
    [fetchRequest setEntity:entity];
    self.relatives = [APP_MGR getAllPeople];
    self.title = @"Family";
    
    [[self tblView] reloadData];
}

@end
