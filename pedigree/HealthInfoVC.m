//
//  HealthInfoVC.m
//  pedigree
//
//  Created by Madhavi Tammineni on 1/30/14.
//  Copyright (c) 2014 CDC Informatics R&D Lab. All rights reserved.
//

#import "HealthInfoVC.h"
#import "DiseasesUtil.h"
#import "SelectDiseaseVC.h"
#import "DiseaseSubCategoryVCViewController.h"
#import "AppManager.h"

@interface HealthInfoVC ()

@property (nonatomic, strong) IBOutlet UITableView *conditionsTblView;
@property (nonatomic, strong) NSArray *mainDiseasesArr;
@property (nonatomic) NSInteger selectedDiseaseIndex;
@property (nonatomic, strong) DiseaseSubCategoryVCViewController *diseaseSubCatVC;
@property (nonatomic, strong) SelectDiseaseVC *diseaseVC;

@property (nonatomic, strong) DiseasesUtil *disUtil;

@end

@implementation HealthInfoVC

@synthesize relative;
@synthesize arrDiseases;

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
    
    if (arrDiseases == nil) {
        arrDiseases = [[NSMutableArray alloc] init];
    }
    
    _disUtil = [[DiseasesUtil alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dismissWithDoneSelectDiseaseVC:(UIStoryboardSegue *)segue {
    _diseaseVC = segue.sourceViewController;
 
    [arrDiseases addObjectsFromArray:[_diseaseVC.setSelectedDiseases allObjects]];
    [_conditionsTblView reloadData];
    [_diseaseVC dismissViewControllerAnimated:YES completion:nil];
    
}

- (IBAction)dismissWithCancelSelectDiseaseVC:(UIStoryboardSegue *)segue {
    SelectDiseaseVC *selectDiseaseVC = segue.sourceViewController;
    [selectDiseaseVC dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40.0;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.conditionsTblView.frame.size.width, 40)];
    
    UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, self.conditionsTblView.frame.size.width, 40)];
    [lbl setFont:[UIFont boldSystemFontOfSize:16.0]];
    
    NSString *str = @"Existing Conditions";
    [lbl setText:str];
    
    [headerView addSubview:lbl];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [btn setFrame:CGRectMake(275.0, 5.0, 40.0, 40.0)];
    btn.tag = section;
    btn.hidden = NO;
    [btn addTarget:self action:@selector(showDiseases:) forControlEvents:UIControlEventTouchDown];
    [headerView addSubview:btn];
    
    return headerView;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [arrDiseases count] ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ExistingConditionsCell";
    ExistingConditionsCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.lbldisease.text = [[arrDiseases objectAtIndex:indexPath.row] name];
    cell.lbldiseaseCategory.text = [[arrDiseases objectAtIndex:indexPath.row] categoryName];
    cell.lblAge.text = [@"Age at Diagnosis: " stringByAppendingString:[_disUtil.ageGroupArr objectAtIndex:[[[arrDiseases objectAtIndex:indexPath.row] ageAtDiagnosis] integerValue]]];
    
    return cell;
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        //[tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}


-(IBAction)showDiseases:(id)sender
{
    [self performSegueWithIdentifier:@"showSelectDiseaseSegue" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

-(void)displayRelativeData:(Relative *)currRelative
{
    arrDiseases = [[currRelative.contractedDisease allObjects] mutableCopy];
    [self.conditionsTblView reloadData];
}

@end
