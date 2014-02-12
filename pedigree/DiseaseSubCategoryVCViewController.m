//
//  DiseaseSubCategoryVCViewController.m
//  pedigree
//
//  Created by Murali Tammineni on 1/30/14.
//  Copyright (c) 2014 CDC Informatics R&D Lab. All rights reserved.
//

#import "DiseaseSubCategoryVCViewController.h"
#import "DiseasesUtil.h"
#import "AppManager.h"
#import "SelectAgeVC.h"

@interface DiseaseSubCategoryVCViewController ()

@property (nonatomic, strong) NSArray *subDiseasesArr;
@property (nonatomic) NSInteger selectedSubDiseaseIndex;

@property (nonatomic, strong) NSArray *ageGroupArr;
@property (nonatomic) NSInteger selectedAgeIndex;

@property (nonatomic, weak) IBOutlet UITableView *tblView;
@property (nonatomic, strong) IBOutlet UIPickerView *agePicker;
@property (nonatomic, weak) IBOutlet UITextField *txtAge;

@property (nonatomic, strong) NSArray *mainDiseasesArr;

@property (nonatomic, strong) SelectAgeVC *selectAgeVC;

@end

@implementation DiseaseSubCategoryVCViewController

@synthesize _mainDiseaseId;
@synthesize contractedDis;

@synthesize _checkboxSelections;
@synthesize mainDiseaseName;


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
   // contractedDis = [[ContractedDisease alloc] init];
    contractedDis = [NSEntityDescription insertNewObjectForEntityForName:@"ContractedDisease" inManagedObjectContext:APP_MGR.managedObjectContext];
    
    _mainDiseasesArr = @[@"No Known Conditions", @"Cancer", @"Clotting Disorder", @"Dementia/Alzheimers", @"Diabetes/Prediabetes/metabolic Syndrome", @"Gastrointestinal Disorder",
                         @"Heart Disease", @"High Cholesterol", @"Hypertension", @"kidney Disease",
                         @"Lung Disease", @"Osteoporosis", @"Psychological Disorder", @"Septecemia",
                         @"Stroke/ Brain Attack", @"Sudden Infant Death Syndrome", @"Unknown Disease", @"Other-Add New"];
    
    //setting the arr with the list of sub-disease categories of the selected main disease in the last VC
    NSString* path = [[NSBundle mainBundle] pathForResource:@"Diseases_Catalog_2" ofType:@"plist"];
    NSArray* arr = [NSArray arrayWithContentsOfFile:path];

    _subDiseasesArr = [[NSMutableArray alloc] init];
    for (NSDictionary *dict in arr) {
        if ([dict objectForKey:@"Disease_Number"] == _mainDiseaseId) {
            _subDiseasesArr = (NSMutableArray *)[dict objectForKey:@"Disease_Sub_Category"];
        }
    }
    
    _ageGroupArr = [[NSArray alloc] initWithObjects:
                    @"Pre-Birth",@"Newborn",@"In Infancy",@"In Childhood",@"In Adolescence", @"20-29 years", @"30-39 years", @"40-49 years", @"50-59 years", @"60 years and older", @"Unknown",nil];
    
    _selectedSubDiseaseIndex = -1;
    _selectedDiseasesSet = [[NSMutableSet alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dismissSelectDiseaseVC:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [_subDiseasesArr count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"SubDiseaseCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.textLabel.text = [_subDiseasesArr objectAtIndex:indexPath.row];
    
    int flag = 1 << indexPath.row;
    // update row's accessory if it's "turned on"
    if (_checkboxSelections & flag) cell.accessoryType = UITableViewCellAccessoryCheckmark;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _selectedSubDiseaseIndex = indexPath.row;
    contractedDis.name = [_subDiseasesArr objectAtIndex:indexPath.row];
    contractedDis.categoryName = [_mainDiseasesArr objectAtIndex:[_mainDiseaseId integerValue]];
    
    _checkboxSelections ^= 1 << indexPath.row;
    Disease *_selectedDisease = [[Disease alloc] init];
    _selectedDisease.categoryName = mainDiseaseName;
    [_selectedDiseasesSet addObject:_selectedDisease];
    
    [self.tblView reloadData];
    [self performSegueWithIdentifier:@"showAgePickerSegue2" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"showAgePickerSegue2"])
    {
        _selectAgeVC = segue.destinationViewController;
    }
    
}

- (IBAction)dismissWithDoneSelectAgeVC:(UIStoryboardSegue *)segue {
    
    SelectAgeVC *selectAgeVC = segue.sourceViewController;
    [selectAgeVC dismissViewControllerAnimated:YES completion:nil];
}

@end
