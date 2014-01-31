//
//  HealthInfoNewVC.m
//  pedigree
//
//  Created by Murali Tammineni on 1/29/14.
//  Copyright (c) 2014 CDC Informatics R&D Lab. All rights reserved.
//

#import "HealthInfoNewVC.h"
#import "Relative.h"
#import "SelectDiseaseVC.h"

@interface HealthInfoNewVC ()

@property (nonatomic, strong) IBOutlet UITableView *tblDiseases;
@property (nonatomic, weak) Relative *relative;
@property (nonatomic, weak) SelectDiseaseVC *selectDiseaseVC;

@end

@implementation HealthInfoNewVC

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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 2;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"Contracted Disease";
    }
    else if (section == 1){
        return @"Contracted Disease sub-category";
    }
    else{
        return@"";
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30.0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MyIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }

    if (indexPath.section == 0) {
        // Configure the cell...
        if (indexPath.row == 0) {
            cell.textLabel.text = @"Disease";
            cell.detailTextLabel.text = @"";
        }
        if (indexPath.row == 1) {
            cell.textLabel.text = @"Age";
            cell.detailTextLabel.text = @"";
        }
        
    }
    if (indexPath.section == 1) {
        // Configure the cell...
        if (indexPath.row == 0) {
            cell.textLabel.text = @"Disease";
            cell.detailTextLabel.text = @"";
        }
        if (indexPath.row == 1) {
            cell.textLabel.text = @"Age";
            cell.detailTextLabel.text = @"";
        }

    }
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    // [self.navigationController pushViewController:detailViewController animated:YES];
    [self performSegueWithIdentifier:@"showSelectDiseaseSegue" sender:nil];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"showSelectDiseaseSegue"])
    {
        _selectDiseaseVC = segue.destinationViewController;
    }
}



@end
