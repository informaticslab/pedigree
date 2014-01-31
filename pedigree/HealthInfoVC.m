//
//  HealthInfoVC.m
//  pedigree
//
//  Created by Murali Tammineni on 1/30/14.
//  Copyright (c) 2014 CDC Informatics R&D Lab. All rights reserved.
//

#import "HealthInfoVC.h"
#import "DiseasesUtil.h"
#import "DiseaseSubCategoryVCViewController.h"

@interface HealthInfoVC ()

@property (nonatomic, strong) IBOutlet UIPickerView *diseasePicker;
@property (nonatomic, strong) NSArray *mainDiseasesArr;
@property (nonatomic) NSInteger selectedDiseaseIndex;
@property (nonatomic, strong) DiseaseSubCategoryVCViewController *diseaseSubCatVC;

-(IBAction)addDisease:(id)sender;

@end

@implementation HealthInfoVC

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
    
    //setting the arr with the list of main disease categories
    _mainDiseasesArr = @[@"No Known Conditions", @"Cancer", @"Clotting Disorder", @"Dementia/Alzheimers", @"Diabetes/Prediabetes/metabolic Syndrome", @"Gastrointestinal Disorder",
                         @"Heart Disease", @"High Cholesterol", @"Hypertension", @"kidney Disease",
                         @"Lung Disease", @"Osteoporosis", @"Psychological Disorder", @"Septecemia",
                         @"Stroke/ Brain Attack", @"Sudden Infant Death Syndrome", @"Unknown Disease", @"Other-Add New"];
    
   [_diseasePicker selectRow:4 inComponent:0 animated:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfComponentsInPickerView:
(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component
{
    return _mainDiseasesArr.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    return _mainDiseasesArr[row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row
      inComponent:(NSInteger)component
{
    NSString *resultString = _mainDiseasesArr[row];
    NSLog(@"The selected Main Disease is: %@", resultString);
    _selectedDiseaseIndex = row;
}

-(IBAction)addDisease:(id)sender{
    
    switch (_selectedDiseaseIndex) {
        case kNoKnownConditions:
        {
            //do nothing
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
            //do nothing
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
            //do nothing
            break;
        }case kHyperTension:
        {
            //do nothing
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
            //do nothing
            break;
        }
        case kPsychologicalDisorder:
        {
            [self performSegueWithIdentifier:@"showDiseaseSubCategoryVC" sender:self];
            break;
        }
        case kSepticemia:
        {
            //do nothing
            break;
        }
        case kStrokeBrainAttack:
        {
            //do nothing
            break;
        }
        case kSuddenInfantDeathSyndrome:
        {
            //do nothing
            break;
        }
        case kUnknownDisease:
        {
            //do nothing
            break;
        }
        case kOtherAddNew:
        {
            //do nothing
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


@end
