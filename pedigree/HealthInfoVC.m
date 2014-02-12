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

@synthesize arrContractedDiseases;
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
    
    //creating the arr to hold the contactedDiseases objects
    if (arrContractedDiseases == nil) {
        arrContractedDiseases = [[NSMutableArray alloc] init];;
    }
    
    if (arrDiseases == nil) {
        arrDiseases = [[NSMutableArray alloc] init];;
    }
    
    if (relative == nil) {
       relative = [NSEntityDescription insertNewObjectForEntityForName:@"Relative" inManagedObjectContext:APP_MGR.managedObjectContext];
    }
    
 }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dismissWithDoneSelectDiseaseVC:(UIStoryboardSegue *)segue {
    SelectDiseaseVC *selectDiseaseVC = segue.sourceViewController;
 //   [relative addContractedDiseaseObject:selectDiseaseVC.contractedDis];
//   [arrContractedDiseases addObject:selectDiseaseVC.contractedDis];
//NSLog(@"HealthInfoVC :: The total number of diseases in the HealthVC are: %lu", (unsigned long)[relative.contractedDisease count]);
   
    [arrDiseases addObjectsFromArray:[selectDiseaseVC.selectedDiseasesSet allObjects]];
     NSLog(@"HealthInfoVC :: The total number of diseases in the HealthVC, selectedDiseaseSet are: %d", [selectDiseaseVC.selectedDiseasesSet count]);
    
    [_conditionsTblView reloadData];
    [selectDiseaseVC dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)dismissWithCancelSelectDiseaseVC:(UIStoryboardSegue *)segue {
    SelectDiseaseVC *selectDiseaseVC = segue.sourceViewController;
    [selectDiseaseVC dismissViewControllerAnimated:YES completion:nil];
}

/*
- (IBAction)dismissWithDoneDiseaseSubCategoryVC:(UIStoryboardSegue *)segue {
    
    DiseaseSubCategoryVCViewController *diseaseSubCatVC = segue.sourceViewController;
    [relative addContractedDiseaseObject:diseaseSubCatVC.contractedDis];
 
    [arrContractedDiseases addObject:diseaseSubCatVC.contractedDis];
    
    [arrDiseases addObjectsFromArray:[diseaseSubCatVC.selectedDiseasesSet allObjects]];
     NSLog(@"HealthInfoVC :: The total number of diseases in the HealthVC, arrDiseases are: %d", [arrDiseases count]);
    
    [_conditionsTblView reloadData];
    [diseaseSubCatVC dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)dismissWithCancelDiseaseSubCategoryVC:(UIStoryboardSegue *)segue {
    
    DiseaseSubCategoryVCViewController *diseaseSubCatVC = segue.sourceViewController;
    [diseaseSubCatVC dismissViewControllerAnimated:YES completion:nil];
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
