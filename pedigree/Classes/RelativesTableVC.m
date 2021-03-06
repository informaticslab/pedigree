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
#import "IntroVC.h"
#import "FamilyMemberCell.h"

@interface RelativesTableVC ()

@property (nonatomic, weak) Relative *me;
@property (nonatomic, strong) PersonDetailsVC *personDetailsVC;
@property (nonatomic) NSInteger selectedRelationId;

@end

@implementation RelativesTableVC

@synthesize personDetailsVC;
@synthesize tblView;

AppManager *appMgr;
FamilyTree *famTree;
Relative *currRelative;

BOOL viewPersonDetails = NO;

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
   // self.title = @"Family";
    self.tabBarController.tabBar.hidden = NO;
    
    if ([self.relatives count] <= 0) {
        //display the intro VC.
        [self performSegueWithIdentifier:@"showIntroSegue" sender:self];
    }
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
    FamilyMemberCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    NSInteger index = [indexPath row];
    Relative *relative = (Relative *)[_relatives objectAtIndex:index];
    
    NSData *data = relative.profileImage;
    if (data == nil) {
        [cell.imgRelativePhoto setImage:[UIImage imageNamed:@"111-user.png"]];
    }
    else{
       [cell.imgRelativePhoto setImage:[UIImage imageWithData:relative.profileImage]];
    }
    
    cell.lblRelativeName.text = [NSString stringWithFormat:@"%@ %@", relative.firstName, relative.lastName];
    cell.lblRelationDescription.text = relative.relationDescription;
    
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
    viewPersonDetails = YES;
    currRelative = (Relative *)[_relatives objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"showPersonSegue" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"showPersonSegue"])
    {
        personDetailsVC = (PersonDetailsVC *)[segue.destinationViewController topViewController];
        personDetailsVC.selectedRelationId = _selectedRelationId;
        
        if (viewPersonDetails == YES) {
            personDetailsVC.editingMode = NO;
            personDetailsVC.relative = currRelative;
        }
        else if (viewPersonDetails == NO){
            personDetailsVC.editingMode = YES;
        }
    }
    
}

- (IBAction)dismissWithDoneRelationshipVC:(UIStoryboardSegue *)segue {
    SelectRelationshipVC *relationshipVC = segue.sourceViewController;
   _selectedRelationId = relationshipVC._selectedIndex;
    
    if (relationshipVC._selectedIndex < 0) {
        
        [self.navigationController popToRootViewControllerAnimated:YES];
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"No One Was Added" message:@"To add someone to your family tree, please select a relationship before tapping Done" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alertView show];
    }
    else{
       
        [self.navigationController popToRootViewControllerAnimated:YES];
        [relationshipVC removeFromParentViewController];
        viewPersonDetails = NO;
        [self performSegueWithIdentifier:@"showPersonSegue" sender:self];
    }
}

- (IBAction)dismissWithCancelRelationshipVC:(UIStoryboardSegue *)segue {
    
    SelectRelationshipVC *relationshipVC = segue.sourceViewController;
    [relationshipVC dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)dismissWithCancelPersonVC:(UIStoryboardSegue *)segue {
    personDetailsVC = segue.sourceViewController;
    [personDetailsVC dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)dismissWithDoneAddingPersonVC:(UIStoryboardSegue *)segue {

    [self.navigationController popToRootViewControllerAnimated:YES];
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
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
    
    // Schedule the notification
    UILocalNotification* localNotification = [[UILocalNotification alloc] init];
    localNotification.fireDate = [NSDate dateWithTimeInterval:2 sinceDate:[NSDate date]];
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    
    // Request to reload table view data
     [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];

}

@end
