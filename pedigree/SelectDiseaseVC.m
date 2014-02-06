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

@interface SelectDiseaseVC ()

@property (nonatomic, strong) NSArray *mainDiseasesArr;
@property (nonatomic) NSInteger selectedDiseaseIndex;

@property (nonatomic, strong) NSArray *ageGroupArr;
@property (nonatomic) NSInteger selectedAgeIndex;

@property (nonatomic, weak) IBOutlet UITableView *tblView;
@property (nonatomic, strong) DiseaseSubCategoryVCViewController *diseaseSubCatVC;
@property (nonatomic, strong) IBOutlet UIPickerView *agePicker;
@property (nonatomic, weak) IBOutlet UITextField *txtAge;

@end


@implementation SelectDiseaseVC

@synthesize contractedDis;

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
    contractedDis = [NSEntityDescription insertNewObjectForEntityForName:@"ContractedDisease" inManagedObjectContext:APP_MGR.managedObjectContext];
    
    //setting the arr with the list of main disease categories
    _mainDiseasesArr = @[@"No Known Conditions", @"Cancer", @"Clotting Disorder", @"Dementia/Alzheimers", @"Diabetes/Prediabetes/metabolic Syndrome", @"Gastrointestinal Disorder",
                         @"Heart Disease", @"High Cholesterol", @"Hypertension", @"kidney Disease",
                         @"Lung Disease", @"Osteoporosis", @"Psychological Disorder", @"Septecemia",
                         @"Stroke/ Brain Attack", @"Sudden Infant Death Syndrome", @"Unknown Disease", @"Other-Add New"];
    
    _selectedDiseaseIndex = -1;
    
    _ageGroupArr = [[NSArray alloc] initWithObjects:
                    @"Pre-Birth",@"Newborn",@"In Infancy",@"In Childhood",@"In Adolescence", @"20-29 years", @"30-39 years", @"40-49 years", @"50-59 years", @"60 years and older", @"Unknown",nil];
    
    //setting up the Age PickerView
    _agePicker =[[UIPickerView alloc]init];
    _agePicker.delegate = self;
    _agePicker.dataSource = self;
    _agePicker.showsSelectionIndicator=YES;
    [_agePicker selectRow:0 inComponent:0 animated:YES];
    
    UIToolbar *toolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    toolBar.barStyle = UIBarStyleBlackOpaque;
    
    UIBarButtonItem *btn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneBtnPressToGetValue:)];
    
    [toolBar setItems:[NSArray arrayWithObject:btn]];
    _txtAge.inputAccessoryView = toolBar;
    _txtAge.inputView = _agePicker;
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
    if(indexPath.row == _selectedDiseaseIndex){
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _selectedDiseaseIndex = indexPath.row;
    
    contractedDis.name = @"";
    contractedDis.categoryName = [_mainDiseasesArr objectAtIndex:_selectedDiseaseIndex];
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
    
}

-(void)showDiseaseSubCategory{
    
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
         break;
     }case kHyperTension:
     {
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
         break;
     }
     case kPsychologicalDisorder:
     {
         [self performSegueWithIdentifier:@"showDiseaseSubCategorySegue" sender:self];
         break;
     }
     case kSepticemia:
     {
         break;
     }
     case kStrokeBrainAttack:
     {
         break;
     }
     case kSuddenInfantDeathSyndrome:
     {
         break;
     }
     case kUnknownDisease:
     {
         break;
     }
     case kOtherAddNew:
     {
         break;
     }
     default:
         break;
     
   }
}

- (int)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (int)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [_mainDiseasesArr count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [_ageGroupArr objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    _txtAge.text = [_ageGroupArr objectAtIndex:row];
    _selectedAgeIndex = row;
    
    contractedDis.ageAtDiagnosis = [NSNumber numberWithInteger:_selectedAgeIndex];
}

-(IBAction)doneBtnPressToGetValue:(id)sender
{
    [_txtAge resignFirstResponder];
}

@end
