//
//  SelectDiseaseVC.m
//  pedigree
//
//  Created by Murali Tammineni on 1/29/14.
//  Copyright (c) 2014 CDC Informatics R&D Lab. All rights reserved.
//

#import "SelectDiseaseVC.h"
#import "DiseasesUtil.h"

@interface SelectDiseaseVC ()

@property (nonatomic, strong) IBOutlet UIPickerView *diseasePicker;
@property (nonatomic, strong) NSArray *mainDiseasesArr;

- (IBAction)dismissSelectDiseaseVC:(id)sender;

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
    
    //setting the arr with the list of main disease categories
    _mainDiseasesArr = @[@"No Known Conditions", @"Cancer", @"Clotting Disorder", @"Dementia/Alzheimers", @"Diabetes/Prediabetes/metabolic Syndrome", @"Gastrointestinal Disorder",
                      @"Heart Disease", @"High Cholesterol", @"Hypertension", @"kidney Disease",
                      @"Lung Disease", @"Osteoporosis", @"Psychological Disorder", @"Septecemia",
                      @"Stroke/ Brain Attack", @"Sudden Infant Death Syndrome", @"Unknown Disease", @"Other-Add New"];
    
    NSString* path = [[NSBundle mainBundle] pathForResource:@"Diseases_Catalog_2" ofType:@"plist"];
    NSArray* arr = [NSArray arrayWithContentsOfFile:path];
    
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
}

@end
