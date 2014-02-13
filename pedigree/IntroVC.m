//
//  IntroVC.m
//  pedigree
//
//  Created by  Madhavi Tammineni on 1/23/14.
//  Copyright (c) 2014 CDC Informatics R&D Lab. All rights reserved.
//

#import "IntroVC.h"
#import "PersonDetailsVC.h"

@interface IntroVC ()

@property (nonatomic, retain) IBOutlet UILabel *introLbl;
//@property (nonatomic, weak) Person *me;
@property (nonatomic, weak) Relative *me;

@end

PersonDetailsVC *personDetailsVC;

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
    
    self.introLbl.text = @"Start with you or a family member";
 
    /*   [self.introLbl boldSubstring:@"Start"];
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
        personDetailsVC = (PersonDetailsVC *)segue.destinationViewController;
        personDetailsVC.me = _me;
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
    DebugLog(@"The person's firstName is: %@", _me.ethnicity);
    DebugLog(@"The person's firstName is: %@", _me.firstName);
    DebugLog(@"The person's lastName is: %@", _me.lastName);
    
}

@end
