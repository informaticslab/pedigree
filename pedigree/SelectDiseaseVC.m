//
//  SelectDiseaseVC.m
//  pedigree
//
//  Created by Murali Tammineni on 1/29/14.
//  Copyright (c) 2014 CDC Informatics R&D Lab. All rights reserved.
//

#import "SelectDiseaseVC.h"
#import "DiseasesUtil.h"
#import "DiseaseSubCategoryVCViewController.h"
#import "AppManager.h"
#import "ContractedDisease.h"
#import "SelectAgeVC.h"

@interface SelectDiseaseVC ()

@property (nonatomic, strong) NSArray *mainDiseasesArr;
@property (nonatomic) NSInteger selectedDiseaseIndex;

@property (nonatomic, strong) NSArray *ageGroupArr;
@property (nonatomic) NSInteger selectedAgeIndex;

@property (nonatomic, weak) IBOutlet UITableView *tblView;
@property (nonatomic, strong) SelectAgeVC *selectAgeVC;
@property (nonatomic, strong) DiseaseSubCategoryVCViewController *diseaseSubCatVC;

@end

@implementation SelectDiseaseVC

//@synthesize contractedDis;
@synthesize _checkboxSelections;

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
//    contractedDis = [NSEntityDescription insertNewObjectForEntityForName:@"ContractedDisease" inManagedObjectContext:APP_MGR.managedObjectContext];
    
    //setting the arr with the list of main disease categories
    _mainDiseasesArr = @[@"No Known Conditions", @"Cancer", @"Clotting Disorder", @"Dementia/Alzheimers", @"Diabetes/Prediabetes/metabolic Syndrome", @"Gastrointestinal Disorder",
                         @"Heart Disease", @"High Cholesterol", @"Hypertension", @"kidney Disease",
                         @"Lung Disease", @"Osteoporosis", @"Psychological Disorder", @"Septecemia",
                         @"Stroke/ Brain Attack", @"Sudden Infant Death Syndrome", @"Unknown Disease", @"Other-Add New"];
    
    _selectedDiseaseIndex = -1;
    
//    _ageGroupArr = [[NSArray alloc] initWithObjects:
//                    @"Pre-Birth",@"Newborn",@"In Infancy",@"In Childhood",@"In Adolescence", @"20-29 years", @"30-39 years", @"40-49 years", @"50-59 years", @"60 years and older", @"Unknown",nil];
//    
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
    return [_mainDiseasesArr count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"DiseaseCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryNone;
    
    cell.textLabel.text = [_mainDiseasesArr objectAtIndex:indexPath.row];
  
    int flag = 1 << indexPath.row;
    // update row's accessory if it's "turned on"
    if (_checkboxSelections & flag) cell.accessoryType = UITableViewCellAccessoryCheckmark;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _checkboxSelections ^= 1 << indexPath.row;
    _selectedDiseaseIndex = indexPath.row;
    
//    contractedDis.name = @"";
//    contractedDis.categoryName = [_mainDiseasesArr objectAtIndex:_selectedDiseaseIndex];
    
    [self.tblView reloadData];
    [self showDiseaseSubCategory];
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"showDiseaseSubCategorySegue"])
    {
        _diseaseSubCatVC = segue.destinationViewController;
        _diseaseSubCatVC._mainDiseaseId = [NSNumber numberWithInteger:_selectedDiseaseIndex];
    }
    if([segue.identifier isEqualToString:@"showAgePickerSegue"])
    {
        _selectAgeVC = segue.destinationViewController;
    }
   
}

-(void)showDiseaseSubCategory{
    
    Disease *_selectedDisease = [[Disease alloc] init];
    _selectedDisease.categoryName = [_mainDiseasesArr objectAtIndex:_selectedDiseaseIndex];
    
    switch (_selectedDiseaseIndex) {
     case kNoKnownConditions:
     {
         break;
     }
     case kCancer:
     {
         [self performSegueWithIdentifier:@"showDiseaseSubCategorySegue" sender:self];
         break;
     }
     case kClottingDisorder:
     {
         [self performSegueWithIdentifier:@"showDiseaseSubCategorySegue" sender:self];
         break;
     }
     case kDementiaAlzheimers:
     {
          _selectedDisease.name = [_mainDiseasesArr objectAtIndex:kDementiaAlzheimers];
         [self performSegueWithIdentifier:@"showAgePickerSegue" sender:self];
         break;
     }
     case kDiabetes:
     {
         [self performSegueWithIdentifier:@"showDiseaseSubCategorySegue" sender:self];
         break;
     }
     case kGastro:
     {
         [self performSegueWithIdentifier:@"showDiseaseSubCategorySegue" sender:self];
         break;
     }
     case kHeart:
     {
         [self performSegueWithIdentifier:@"showDiseaseSubCategorySegue" sender:self];
         break;
     }
     case kHighCholesterol:
     {
         _selectedDisease.name = [_mainDiseasesArr objectAtIndex:kHighCholesterol];
         [self performSegueWithIdentifier:@"showAgePickerSegue" sender:self];
         break;
     }case kHyperTension:
     {
         _selectedDisease.name = [_mainDiseasesArr objectAtIndex:kHighCholesterol];
         [self performSegueWithIdentifier:@"showAgePickerSegue" sender:self];
         break;
     }case kKidney:
     {
         [self performSegueWithIdentifier:@"showDiseaseSubCategorySegue" sender:self];
         break;
     }
     case kLung:
     {
         [self performSegueWithIdentifier:@"showDiseaseSubCategorySegue" sender:self];
         break;
     }
     case kOsteoporosis:
     {
         _selectedDisease.name = [_mainDiseasesArr objectAtIndex:kOsteoporosis];
         [self performSegueWithIdentifier:@"showAgePickerSegue" sender:self];
         break;
     }
     case kPsychologicalDisorder:
     {
         [self performSegueWithIdentifier:@"showDiseaseSubCategorySegue" sender:self];
         break;
     }
     case kSepticemia:
     {
         _selectedDisease.name = [_mainDiseasesArr objectAtIndex:kSepticemia];
         [self performSegueWithIdentifier:@"showAgePickerSegue" sender:self];
         break;
     }
     case kStrokeBrainAttack:
     {
         _selectedDisease.name = [_mainDiseasesArr objectAtIndex:kStrokeBrainAttack];
         [self performSegueWithIdentifier:@"showAgePickerSegue" sender:self];
         break;
     }
     case kSuddenInfantDeathSyndrome:
     {
         _selectedDisease.name = [_mainDiseasesArr objectAtIndex:kSuddenInfantDeathSyndrome];
         [self performSegueWithIdentifier:@"showAgePickerSegue" sender:self];
         break;
     }
     case kUnknownDisease:
     {
         _selectedDisease.name = [_mainDiseasesArr objectAtIndex:kUnknownDisease];
         [self performSegueWithIdentifier:@"showAgePickerSegue" sender:self];
         break;
     }
     case kOtherAddNew:
     {
         break;
     }
     default:
         break;
     
   }

    [_selectedDiseasesSet addObject:_selectedDisease];
}


- (IBAction)dismissWithDoneDiseaseSubCategoryVC:(UIStoryboardSegue *)segue {
    
    DiseaseSubCategoryVCViewController *diseaseSubCatVC = segue.sourceViewController;
    [_selectedDiseasesSet addObjectsFromArray:[diseaseSubCatVC.selectedDiseasesSet allObjects]];
    [diseaseSubCatVC dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)dismissWithCancelDiseaseSubCategoryVC:(UIStoryboardSegue *)segue {
    
    DiseaseSubCategoryVCViewController *diseaseSubCatVC = segue.sourceViewController;
    [diseaseSubCatVC dismissViewControllerAnimated:YES completion:nil];
}

@end
