//
//  MainTabBarVC.m
//  pedigree
//
//  Created by jtq6 on 9/25/13.
//  Copyright (c) 2013 CDC Informatics R&D Lab. All rights reserved.
//

#import "MainTabBarVC.h"
#import "Relative.h"
#import "Person.h"
#import "ContractedDisease.h"
#import "IntroVC.h"

@interface MainTabBarVC ()

@property (nonatomic, retain) IntroVC *introVC;

@end

@implementation MainTabBarVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewDidAppear:(BOOL)animated{
   
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self loadTestData];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadTestData
{
    
  /*  Relative *newRelative = [NSEntityDescription insertNewObjectForEntityForName:@"Relative" inManagedObjectContext:APP_MGR.managedObjectContext ];
    newRelative.lastName = @"Smithereen";
    newRelative.firstName = @"John";
    newRelative.relationDescription = @"Father";
    
    NSError *error = nil;
    [APP_MGR.managedObjectContext save:&error];
    
    if (error)
    {
        DebugLog(@"Problem loading test data: %@", error);
    }
   */
    
 /*   Person *me = [NSEntityDescription insertNewObjectForEntityForName:@"Person"
                                               inManagedObjectContext:APP_MGR.managedObjectContext];
   // me.dateOfBirth =
    me.ethnicity = [NSNumber numberWithInt:1];
    me.firstName = @"John";
    me.gender = [NSNumber numberWithInt:1];
    me.height = [NSNumber numberWithDouble:5.2];
    me.isAdopted = [NSNumber numberWithInt:0];
    me.isIdenticalTwin = [NSNumber numberWithInt:0];
    me.isLiving = [NSNumber numberWithInt:1];
    me.isTwin = [NSNumber numberWithInt:0];
    me.lastName = @"Doe";
    me.race = [NSNumber numberWithInt:5];
    me.weight = [NSNumber numberWithInt:120];
    
    NSError *error = nil;
    [APP_MGR.managedObjectContext save:&error];
    
    if (error)
    {
        DebugLog(@"Problem loading test data: %@", error);
    }
  */
    
    Relative *newRelative = [NSEntityDescription insertNewObjectForEntityForName:@"Relative" inManagedObjectContext:APP_MGR.managedObjectContext ];
    newRelative.lastName = @"Doe";
    newRelative.firstName = @"John";
    newRelative.relationDescription = @"Self";
    
    newRelative.ethnicity = [NSNumber numberWithInt:1];
    newRelative.gender = [NSNumber numberWithInt:1];
    newRelative.height = [NSNumber numberWithDouble:5.2];
    newRelative.isAdopted = [NSNumber numberWithInt:0];
    newRelative.isIdenticalTwin = [NSNumber numberWithInt:0];
    newRelative.isLiving = [NSNumber numberWithInt:1];
    newRelative.isTwin = [NSNumber numberWithInt:0];
    newRelative.race = [NSNumber numberWithInt:5];
    newRelative.weight = [NSNumber numberWithInt:120];
    
    ContractedDisease *contractedDis1 = [NSEntityDescription insertNewObjectForEntityForName:@"ContractedDisease"inManagedObjectContext:APP_MGR.managedObjectContext ];
    
    contractedDis1.categoryName = @"Cancer";
    contractedDis1.name = @"Lung Cancer";
    contractedDis1.ageAtDiagnosis = [NSNumber numberWithInt:3];
    [newRelative addContractedDiseaseObject:contractedDis1];
    
    ContractedDisease *contractedDis2 = [NSEntityDescription insertNewObjectForEntityForName:@"ContractedDisease"inManagedObjectContext:APP_MGR.managedObjectContext ];
    
    contractedDis2.categoryName = @"High Cholesterol";
    contractedDis2.name = @"High Cholesterol";
    contractedDis2.ageAtDiagnosis = [NSNumber numberWithInt:3];
    [newRelative addContractedDiseaseObject:contractedDis2];
    
    
    Relative *newRelativeSon = [NSEntityDescription insertNewObjectForEntityForName:@"Relative" inManagedObjectContext:APP_MGR.managedObjectContext ];
    newRelativeSon.lastName = @"Doe";
    newRelativeSon.firstName = @"Chris";
    newRelativeSon.relationDescription = @"Son";
    
    newRelativeSon.ethnicity = [NSNumber numberWithInt:1];
    newRelativeSon.gender = [NSNumber numberWithInt:1];
    newRelativeSon.height = [NSNumber numberWithDouble:5.5];
    newRelativeSon.isAdopted = [NSNumber numberWithInt:0];
    newRelativeSon.isIdenticalTwin = [NSNumber numberWithInt:0];
    newRelativeSon.isLiving = [NSNumber numberWithInt:1];
    newRelativeSon.isTwin = [NSNumber numberWithInt:0];
    newRelativeSon.race = [NSNumber numberWithInt:5];
    newRelativeSon.weight = [NSNumber numberWithInt:120];
    
    Relative *newRelativeDaughter = [NSEntityDescription insertNewObjectForEntityForName:@"Relative" inManagedObjectContext:APP_MGR.managedObjectContext ];
    newRelativeDaughter.lastName = @"Doe";
    newRelativeDaughter.firstName = @"Jenny";
    newRelativeDaughter.relationDescription = @"Daughter";
    
    newRelativeDaughter.ethnicity = [NSNumber numberWithInt:1];
    newRelativeDaughter.gender = [NSNumber numberWithInt:0];
    newRelativeDaughter.height = [NSNumber numberWithDouble:5.0];
    newRelativeDaughter.isAdopted = [NSNumber numberWithInt:0];
    newRelativeDaughter.isIdenticalTwin = [NSNumber numberWithInt:0];
    newRelativeDaughter.isLiving = [NSNumber numberWithInt:1];
    newRelativeDaughter.isTwin = [NSNumber numberWithInt:0];
    newRelativeDaughter.race = [NSNumber numberWithInt:5];
    newRelativeDaughter.weight = [NSNumber numberWithInt:120];

    
    NSError *error = nil;
    [APP_MGR.managedObjectContext save:&error];
    
    if (error)
    {
        DebugLog(@"Problem loading test data: %@", error);
    }

}

-(void)showIntroView
{
    [self performSegueWithIdentifier:@"showIntroSegue" sender:self];
}

@end
