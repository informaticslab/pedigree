//
//  SelectRelationshipTVC.m
//  pedigree
//
//  Created by jtq6 on 10/29/13.
//  Copyright (c) 2013 CDC Informatics R&D Lab. All rights reserved.
//

#import "SelectRelationshipVC.h"
#import "PersonalInfoTVC.h"
#import "RelationshipUtil.h"

@implementation SelectRelationshipVC

@synthesize tv;
@synthesize relDescription;
@synthesize _selectedIndex;

NSArray *relationships;
NSInteger   _checkboxSelections;
RelationshipUtil *relUtil;

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.navigationItem.hidesBackButton = YES;

    relUtil = [[RelationshipUtil alloc] init];
    relationships = [[NSArray alloc] initWithArray:relUtil.relationshipsArr];
    
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
    CGFloat height = 0.0;
    switch (section) {
        case 0:
        {
            height = 60.0;
            break;
        }
        default:
            break;
    }
    return height;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView;
    
    switch (section) {
        case 0:
        {
            headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tv.frame.size.width, 60)];
            
            UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(15, 15, 30, 30)];
            [img setImage:[UIImage imageNamed:@"111-user.png" ]];
            
            UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(70, 5, self.tv.frame.size.width, 60)];
            [lbl setFont:[UIFont boldSystemFontOfSize:16.0]];
            
            NSString *str = @"Who do you want to add?";
            [lbl setText:str];
            
            [headerView addSubview:img];
            [headerView addSubview:lbl];
            
            break;
        }
        case 1:
        {
            headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tv.frame.size.width, 0.0)];
        }
        default:
            break;
    }
    
    return headerView;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSInteger count = 0;
    switch (section) {
        case 0:
            count = 1;
            break;
        case 1:
            count = [relationships count];
            break;
        default:
            break;
    }
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"SelectRelationshipCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    switch (indexPath.section) {
        case 0:
        {
            if(indexPath.row == 0){
                // Configure the cell...
                cell.backgroundColor = [UIColor lightGrayColor];
                cell.accessoryType = UITableViewCellAccessoryCheckmark;
                cell.textLabel.text = @"Myself";
                
            }
            break;
        }
        case 1:
        {
            cell.accessoryType = UITableViewCellAccessoryNone;
            // Configure the cell...
            cell.textLabel.text = relationships[indexPath.row];
            if (indexPath.row == _selectedIndex) cell.accessoryType = UITableViewCellAccessoryCheckmark;
            
            break;
        }
            
        default:
            break;
     }
    
     return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section)
    {
        case 0:
        {
            break;
        }
        case 1:
        {
            _selectedIndex = indexPath.row;
            relDescription = [relationships objectAtIndex:indexPath.row];
            [self.tv reloadData];
            break;
        }
        default:
            break;
    }
}


-(void) tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
        {
            cell.userInteractionEnabled = NO;
            break;
        }
        case 1:{
            cell.userInteractionEnabled = YES;
            break;
        }
        default:
            break;
    }
}

@end
