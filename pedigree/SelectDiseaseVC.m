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

@interface SelectDiseaseVC ()

@property (nonatomic, strong) IBOutlet UIPickerView *diseasePicker;
@property (nonatomic, strong) NSArray *mainDiseasesArr;
@property (nonatomic) NSInteger selectedDiseaseIndex;

@property (nonatomic, strong) DiseaseSubCategoryVCViewController *diseaseSubCatVC;
@property (nonatomic, strong) IBOutlet UIView *ageView;

@property (nonatomic, strong) IBOutlet UIPickerView *agePicker;
@property (nonatomic, strong) NSArray *ageGroupArr;
@property (nonatomic) NSInteger selectedAgeIndex;


- (IBAction)dismissSelectDiseaseVC:(id)sender;
- (IBAction)hideAgeView:(id)sender;

@end

@implementation SelectDiseaseVC

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
    
    _ageView.hidden = YES;
    
    //setting the arr with the list of main disease categories
    _mainDiseasesArr = @[@"No Known Conditions", @"Cancer", @"Clotting Disorder", @"Dementia/Alzheimers", @"Diabetes/Prediabetes/metabolic Syndrome", @"Gastrointestinal Disorder",
                      @"Heart Disease", @"High Cholesterol", @"Hypertension", @"kidney Disease",
                      @"Lung Disease", @"Osteoporosis", @"Psychological Disorder", @"Septecemia",
                      @"Stroke/ Brain Attack", @"Sudden Infant Death Syndrome", @"Unknown Disease", @"Other-Add New"];
    [_diseasePicker selectRow:4 inComponent:0 animated:YES];
    
    _ageGroupArr = [[NSArray alloc] initWithObjects:
                    @"Pre-Birth",@"Newborn",@"In Infancy",@"In Childhood",@"In Adolescence", @"20-29 years", @"30-39 years", @"40-49 years", @"50-59 years", @"60 years and older", @"Unknown",nil];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dismissSelectDiseaseVC:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (NSInteger)numberOfComponentsInPickerView:
(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component
{
    NSInteger count;
    if (pickerView.tag == 0)
        count = _mainDiseasesArr.count;
    else count = _ageGroupArr.count;
    return count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    NSString *str = @"";
    if (pickerView.tag == 0)
        str = _mainDiseasesArr[row];
    else
        str = _ageGroupArr[row];
    return str;

}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row
      inComponent:(NSInteger)component
{ 
    if (pickerView.tag == 0){
        NSString *resultString = _mainDiseasesArr[row];
        _selectedDiseaseIndex = row;
        DebugLog(@"The selected Main Disease is: %@", resultString);
    }
    else if (pickerView.tag == 1){
        NSString *resultString2 = _ageGroupArr[row];
        _selectedAgeIndex = row;
        DebugLog(@"The Age at which the disease occured is: %@", resultString2);
    }
}

-(IBAction)addDisease:(id)sender{
    
    switch (_selectedDiseaseIndex) {
        case kNoKnownConditions:
        {
            _ageView.hidden = NO;
            break;
        }
        case kCancer:
        {
            [self performSegueWithIdentifier:@"showDiseaseSubCategoryVC" sender:self];
            break;
        }
        case kClottingDisorder:
        {
            [self performSegueWithIdentifier:@"showDiseaseSubCategoryVC" sender:self];
            break;
        }
        case kDementiaAlzheimers:
        {
            _ageView.hidden = NO;
            break;
        }
        case kDiabetes:
        {
            [self performSegueWithIdentifier:@"showDiseaseSubCategoryVC" sender:self];
            break;
        }
        case kGastro:
        {
            [self performSegueWithIdentifier:@"showDiseaseSubCategoryVC" sender:self];
            break;
        }
        case kHeart:
        {
            [self performSegueWithIdentifier:@"showDiseaseSubCategoryVC" sender:self];
            break;
        }
        case kHighCholesterol:
        {
            _ageView.hidden = NO;
            break;
        }case kHyperTension:
        {
            _ageView.hidden = NO;
            break;
        }case kKidney:
        {
            [self performSegueWithIdentifier:@"showDiseaseSubCategoryVC" sender:self];
            break;
        }
        case kLung:
        {
            [self performSegueWithIdentifier:@"showDiseaseSubCategoryVC" sender:self];
            break;
        }
        case kOsteoporosis:
        {
            _ageView.hidden = NO;
            break;
        }
        case kPsychologicalDisorder:
        {
            [self performSegueWithIdentifier:@"showDiseaseSubCategoryVC" sender:self];
            break;
        }
        case kSepticemia:
        {
            _ageView.hidden = NO;
            break;
        }
        case kStrokeBrainAttack:
        {
            _ageView.hidden = NO;
            break;
        }
        case kSuddenInfantDeathSyndrome:
        {
            _ageView.hidden = NO;
            break;
        }
        case kUnknownDisease:
        {
            _ageView.hidden = NO;
            break;
        }
        case kOtherAddNew:
        {
            _ageView.hidden = NO;
            break;
        }
        default:
            break;
            
    }
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"showDiseaseSubCategoryVC"])
    {
        _diseaseSubCatVC = segue.destinationViewController;
        _diseaseSubCatVC._mainDiseaseId = [NSNumber numberWithInteger:_selectedDiseaseIndex];
    }
    
}

- (IBAction)hideAgeView:(id)sender{
    _ageView.hidden = YES;
}

@end
