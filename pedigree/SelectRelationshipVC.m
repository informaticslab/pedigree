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

@synthesize tv;
@synthesize relDescription;
@synthesize _selectedIndex;

NSArray *relationships;
NSInteger   _checkboxSelections;

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.navigationItem.hidesBackButton = YES;
    
    relationships = @[@"Myself", @"Father", @"Mother", @"Brother", @"Sister", @"Son", @"Daughter",
                      @"Paternal Grandfather", @"Paternal Grandmother", @"Paternal Uncle", @"Paternal Aunt",
                      @"Maternal Grandfather", @"Maternal Grandmother", @"Maternal Uncle", @"Maternal Aunt",
                      @"Nephew", @"Niece", @"Grandson", @"Granddaughter", @"Cousin", @"Half-Brother", @"Half-Sister"];
    
    _checkboxSelections = 0;
    _selectedIndex = -1;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 60.0;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tv.frame.size.width, 60)];
    
    UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(15, 15, 30, 30)];
    [img setImage:[UIImage imageNamed:@"111-user.png" ]];
    
    UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(70, 5, self.tv.frame.size.width, 60)];
    [lbl setFont:[UIFont boldSystemFontOfSize:16.0]];
    
    NSString *str = @"Who do you want to add?";
    [lbl setText:str];
    
    [headerView addSubview:img];
    [headerView addSubview:lbl];
    return headerView;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
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
    cell.accessoryType = UITableViewCellAccessoryNone;
    
    // Configure the cell...
    cell.textLabel.text = relationships[indexPath.row];
    
    if (indexPath.row == _selectedIndex) cell.accessoryType = UITableViewCellAccessoryCheckmark;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _selectedIndex = indexPath.row;
    relDescription = [relationships objectAtIndex:indexPath.row];
    [self.tv reloadData];
}

@end
