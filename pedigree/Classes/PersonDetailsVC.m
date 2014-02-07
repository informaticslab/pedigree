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
#import "RelativesTableVC.h"
#import "FamilyBackgroundTVC.h"
#import "HealthInfoVC.h"

@interface PersonDetailsVC ()

@property (weak, nonatomic) IBOutlet UIView *personalInfoView;
@property (weak, nonatomic) IBOutlet UIView *healthInfoView;
@property (weak, nonatomic) IBOutlet UIView *familyBackgroundView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segControl;

- (IBAction)segControlValueChange:(id)sender;
- (IBAction)saveRelation:(id)sender;

@end

PersonalInfoTVC *personalInfoTVC;
HealthInfoVC *healthInfoVC;
FamilyBackgroundTVC *familyBackgroundTVC;
RelativesTableVC *relativesTVC;

BOOL editMode = NO;

@implementation PersonDetailsVC

AppManager *appMgr;

@synthesize txtFirstName;
@synthesize txtLastName;
@synthesize arrContractedDiseases;
@synthesize me;

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
    [self.txtFirstName setDelegate:self];
    [self.txtLastName setDelegate:self];
    
    _segControl.selectedSegmentIndex = 0;
    self.personalInfoView.hidden = NO;
    self.healthInfoView.hidden = YES;
    self.familyBackgroundView.hidden = YES;
    
    [self.view bringSubviewToFront:txtFirstName];
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
    if([segue.identifier isEqualToString:@"embedHealthInfoView"])
    {
        healthInfoVC = (HealthInfoVC *)segue.destinationViewController;
        healthInfoVC.relative = self.me;

    }
    if([segue.identifier isEqualToString:@"embedFamilyInfoTVC"])
    {
        familyBackgroundTVC = (FamilyBackgroundTVC *)segue.destinationViewController;
       // familyBackgroundTVC.relative = self.me;
    }
    if([segue.identifier isEqualToString:@"showRelativesTV"])
    {
        relativesTVC = (RelativesTableVC *)segue.destinationViewController;
    }
  /*  if([segue.identifier isEqualToString:@"showTabBar"])
    {
        _mainTabBarVC = (MainTabBarVC *)segue.destinationViewController;
        relativesTVC = (RelativesTableVC *)segue.destinationViewController;
        //relativesTVC.relative = self.me;
    }
   */
}

-(BOOL) textFieldShouldBeginEditing:(UITextField *)textField
{
    return YES;
}

-(BOOL)textFieldShouldClear:(UITextField *)textField{
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    if(textField == txtFirstName){
        [txtFirstName resignFirstResponder];
    }
    else if(textField == txtLastName){
        [txtLastName resignFirstResponder];
    }
    return YES;
}

-(IBAction)dismissKeyboardOnTap:(id)sender{
  
   // [[self view] endEditing:YES];
    [txtFirstName resignFirstResponder];
    [txtLastName resignFirstResponder];
}


- (IBAction)saveRelation:(id)sender
{
    Relative *_newRelative;
    _newRelative = healthInfoVC.relative;
    
    if (_newRelative == nil) {
        NSLog(@"The relative value is nil. So, setting it up");
        _newRelative = [NSEntityDescription insertNewObjectForEntityForName:@"Relative" inManagedObjectContext:APP_MGR.managedObjectContext ];
    }
    
//    _newRelative.contractedDisease = [NSSet setWithSet:healthInfoVC.relative.contractedDisease];
    _newRelative.firstName = txtFirstName.text;
    _newRelative.lastName = txtLastName.text;
    _newRelative.relationDescription = personalInfoTVC.lblRelationship.text;
   
    _newRelative.isLiving = [NSNumber numberWithBool:personalInfoTVC.isLiving];
    _newRelative.isTwin = [NSNumber numberWithBool:personalInfoTVC.isTwin];
    _newRelative.isIdenticalTwin = [NSNumber numberWithBool:personalInfoTVC.isIdenticalTwin];
    _newRelative.isAdopted = [NSNumber numberWithBool:personalInfoTVC.isAdopted];
    
    _newRelative.areParentsRelatedOtherThanMarraige = [NSNumber numberWithBool:familyBackgroundTVC.areParentsRelatedOtherThanMarriage];
    _newRelative.race = [NSNumber numberWithInteger:familyBackgroundTVC.selectedRaces];
    _newRelative.ethnicity = [NSNumber numberWithInteger:familyBackgroundTVC.selectedEthnicities];
    
    _newRelative.gender = [NSNumber numberWithInt:1];
    _newRelative.height = [NSNumber numberWithDouble:5.2];
    _newRelative.weight = [NSNumber numberWithInt:120];
    
  /*  for (ContractedDisease *dis in healthInfoVC.arrContractedDiseases) {
        [_newRelative addContractedDiseaseObject:dis];
    }
   */
    
    NSError *error = nil;
    [APP_MGR.managedObjectContext save:&error];
    
    if (error)
    {
        DebugLog(@"Problem saving the relative: %@", error);
    }
    
    [self performSegueWithIdentifier:@"showRelativesTV" sender:sender];
    
}

@end
