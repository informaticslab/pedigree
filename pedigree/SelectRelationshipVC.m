//
//  SelectRelationshipTVC.m
//  pedigree
//
//  Created by jtq6 on 10/29/13.
//  Copyright (c) 2013 CDC Informatics R&D Lab. All rights reserved.
//

#import "SelectRelationshipVC.h"
#import "PersonalInfoTVC.h"

@implementation SelectRelationshipVC

@synthesize relDescription;

NSArray *relationships;

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    relationships = @[@"Myself", @"Father", @"Mother", @"Brother", @"Sister", @"Son", @"Daughter",
                      @"Paternal Grandfather", @"Paternal Grandmother", @"Paternal Uncle", @"Paternal Aunt",
                      @"Maternal Grandfather", @"Maternal Grandmother", @"Maternal Uncle", @"Maternal Aunt",
                      @"Nephew", @"Niece", @"Grandson", @"Granddaughter", @"Cousin", @"Half-Brother", @"Half-Sister"];
    
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

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Select a Relationship";
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [relationships count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"SelectRelationshipCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = relationships[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    static NSString *CellIdentifier = @"SelectRelationshipCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    _relative.relationDescription = relationships[indexPath.row];
    relDescription = relationships[indexPath.row];
    
}

@end
