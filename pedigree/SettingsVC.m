//
//  SettingsVC.m
//  pedigree
//
//  Created by Madhavi Tammineni on 4/9/14.
//  Copyright (c) 2014 CDC Informatics R&D Lab. All rights reserved.
//

#import "SettingsVC.h"
#import "Relative.h"
#import "ContractedDisease.h"
#import "AppManager.h"

@interface SettingsVC ()

@end

@implementation SettingsVC

AppManager *appMgr;

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    int rowCount = 2;
    return rowCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"SettingsCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    if(indexPath.row == 0)
    {
        cell.textLabel.text = @"Load Test Data";
    }
    else if(indexPath.row == 1)
    {
        cell.textLabel.text = @"Reset Pedigree";
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 0){
        [self loadTestData];
    }
    else if(indexPath.row == 1){
        // Purge all the Pedigree related data
        NSError * error;
        // retrieve the store URL
        NSURL * storeURL = [[APP_MGR.managedObjectContext persistentStoreCoordinator] URLForPersistentStore:[[[APP_MGR.managedObjectContext persistentStoreCoordinator] persistentStores] lastObject]];
        // lock the current context
        [APP_MGR.managedObjectContext lock];
        [APP_MGR.managedObjectContext reset];//to drop pending changes
        //delete the store from the current managedObjectContext
        if ([[APP_MGR.managedObjectContext persistentStoreCoordinator] removePersistentStore:[[[APP_MGR.managedObjectContext persistentStoreCoordinator] persistentStores] lastObject] error:&error])
        {
            // remove the file containing the data
            [[NSFileManager defaultManager] removeItemAtURL:storeURL error:&error];
            
            //recreate the store like in the  appDelegate method
            [[APP_MGR.managedObjectContext persistentStoreCoordinator] addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error];//recreates the persistent store
        }
        [APP_MGR.managedObjectContext unlock];
        //that's it !

    }
    
}

-(void)loadTestData
{
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


@end
