//
//  SettingsVC.m
//  pedigree
//
//  Created by Madhavi Tammineni on 4/9/14.
//  Copyright (c) 2014 CDC Informatics R&D Lab. All rights reserved.
//

#import "SettingsVC.h"

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
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    int rowCount = 0;
    return rowCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"SettingsCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = @"Reset Pedigree";
    
    return cell;
}

/*
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
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
 */

@end
