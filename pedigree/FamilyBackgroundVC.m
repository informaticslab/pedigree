//
//  FamilyBackgroundVC.m
//  pedigree
//
//  Created by Murali Tammineni on 1/31/14.
//  Copyright (c) 2014 CDC Informatics R&D Lab. All rights reserved.
//

#import "FamilyBackgroundVC.h"
#import "ParentsRelationCell.h"

@interface FamilyBackgroundVC ()
@property(nonatomic, strong) IBOutlet UITableView *familyTV;
@property(nonatomic, strong) IBOutlet ParentsRelationCell *parentsRelationCell;

@end

@implementation FamilyBackgroundVC

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
    
    [self.familyTV registerClass:[ParentsRelationCell class] forCellReuseIdentifier:@"ParentsRelationCell"];
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
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
   /* if(!cell){
        if(indexPath.row == 0){
            cell = [tableView dequeueReusableCellWithIdentifier:@"ParentsRelationCell" forIndexPath:indexPath];
        }
        else if (indexPath.row == 1){
            cell = [tableView dequeueReusableCellWithIdentifier:@"RaceCell" forIndexPath:indexPath];
        }
        else{
            cell = [tableView dequeueReusableCellWithIdentifier:@"EthnicityCell" forIndexPath:indexPath];
        }
        
    }*/
    
    cell = [tableView dequeueReusableCellWithIdentifier:@"ParentsRelationCell" forIndexPath:indexPath];
    if (cell == nil) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"ParentsRelationCell" forIndexPath:indexPath];
    }
    
    return cell;
}

@end
