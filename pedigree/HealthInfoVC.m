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
@property (nonatomic, strong) NSMutableArray *conditionsArr;

@property (nonatomic, strong) NSArray *mainDiseasesArr;
@property (nonatomic) NSInteger selectedDiseaseIndex;
@property (nonatomic, strong) DiseaseSubCategoryVCViewController *diseaseSubCatVC;
@property (nonatomic, strong) SelectDiseaseVC *diseaseVC;

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


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [arrDiseases count] ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ExistingConditionsCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = [[arrDiseases objectAtIndex:indexPath.row] name];
    cell.detailTextLabel.text = [[arrDiseases objectAtIndex:indexPath.row] categoryName];
    
    return cell;
}

@end
