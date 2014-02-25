//
//  IntroVC.m
//  pedigree
//
//  Created by  Madhavi Tammineni on 1/23/14.
//  Copyright (c) 2014 CDC Informatics R&D Lab. All rights reserved.
//

#import "IntroVC.h"
#import "PersonDetailsVC.h"
#import "RelativesTableVC.h"
#import "SelectRelationshipVC.h"

@interface IntroVC ()

@property (nonatomic, retain) IBOutlet UILabel *introLbl;
//@property (nonatomic, weak) Person *me;
@property (nonatomic, weak) Relative *me;
@property(nonatomic, strong) MainTabBarVC *mainTabBarVC;

@end

PersonDetailsVC *personDetailsVC;
RelativesTableVC *relativesTVC;
SelectRelationshipVC *selectRelationshipVC;
NSInteger selectedRelationId;

@implementation IntroVC

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
    
    //self.tabBarController.tabBar.hidden = YES;
    self.introLbl.text = @"Start with you or a family member";
 
    /*[self.introLbl boldSubstring:@"Start"];
    [self.introLbl boldSubstring:@"you"];
    [self.introLbl boldSubstring:@"family member"];
  */
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"showMyProfile"])
    {
        personDetailsVC = (PersonDetailsVC *)[segue.destinationViewController topViewController];
        personDetailsVC.myself = YES;
        personDetailsVC.editingMode = YES;
        personDetailsVC.selectedRelationId = selectedRelationId;
    }
    if([segue.identifier isEqualToString:@"showRelativeProfile"])
    {
        personDetailsVC = (PersonDetailsVC *)[segue.destinationViewController topViewController];
        personDetailsVC.myself = NO;
        personDetailsVC.editingMode = YES;
        personDetailsVC.selectedRelationId = selectedRelationId;
    }
    if([segue.identifier isEqualToString:@"showSelectRelationSegue"])
    {
        selectRelationshipVC = (SelectRelationshipVC *)segue.destinationViewController;
    }
}

-(IBAction)viewMyProfile:(id)sender{
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"Relative" inManagedObjectContext:APP_MGR.managedObjectContext];
    [fetchRequest setEntity:entity];
  //  _me = [APP_MGR getPerson];
    NSArray *fetchedRelatives = [APP_MGR getAllPeople];
    _me = [fetchedRelatives objectAtIndex:0];

    DebugLog(@"The person's Date Of Birth is: %@", _me.dateOfBirth);
    DebugLog(@"The person's ethnicity is: %@", _me.ethnicity);
    DebugLog(@"The person's firstName is: %@", _me.firstName);
    DebugLog(@"The person's lastName is: %@", _me.lastName);

    [self performSegueWithIdentifier:@"showMyProfile" sender:self];
}

- (IBAction)dismissWithDoneRelationshipVC:(UIStoryboardSegue *)segue {
    SelectRelationshipVC *relationshipVC = segue.sourceViewController;
    selectedRelationId = relationshipVC._selectedIndex;
    
    if (relationshipVC._selectedIndex < 0) {
      
        [self.navigationController popToRootViewControllerAnimated:YES];
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Missing Data" message:@"Please select a relationship to add a relative" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alertView show];
    }
    else{
        
        [self.navigationController popToRootViewControllerAnimated:YES];
        [self performSegueWithIdentifier:@"showRelativeProfile" sender:self];
    }
}

-(IBAction)createMyself:(id)sender
{
    [self performSegueWithIdentifier:@"showMyProfile" sender:self];
}

-(IBAction)createRelative:(id)sender
{
    [self performSegueWithIdentifier:@"showSelectRelationSegue" sender:self];
}

- (IBAction)dismissWithCancelPersonVC:(UIStoryboardSegue *)segue {
   
    personDetailsVC = segue.sourceViewController;
    [personDetailsVC dismissViewControllerAnimated:YES completion:nil];
 
}

- (IBAction)dismissWithCancelRelationshipVC:(UIStoryboardSegue *)segue {
    
   [self.navigationController popToRootViewControllerAnimated:YES];
}


@end
