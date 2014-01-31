//
//  DiseaseSubCategoryVCViewController.m
//  pedigree
//
//  Created by Murali Tammineni on 1/30/14.
//  Copyright (c) 2014 CDC Informatics R&D Lab. All rights reserved.
//

#import "DiseaseSubCategoryVCViewController.h"
#import "DiseasesUtil.h"

@interface DiseaseSubCategoryVCViewController ()

@property (nonatomic, strong) IBOutlet UIPickerView *subDiseasePicker;
@property (nonatomic, strong) IBOutlet UIPickerView *ageGroupPicker;
@property (nonatomic, strong) NSMutableArray *subDiseasesArr;
@property (nonatomic, strong) NSArray *ageGroupArr;

-(IBAction)addDisease:(id)sender;

@end

@implementation DiseaseSubCategoryVCViewController

@synthesize _mainDiseaseId;

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
    
    [_ageGroupPicker selectRow:4 inComponent:0 animated:YES];
    [_subDiseasePicker selectRow:2 inComponent:0 animated:YES];
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
    NSInteger count;
    if (pickerView.tag == 0)
        count = _subDiseasesArr.count;
    else count = _ageGroupArr.count;
    return count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    NSString *str = @"";
    if (pickerView.tag == 0)
        str = _subDiseasesArr[row];
    else
        str = _ageGroupArr[row];
    return str;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row
      inComponent:(NSInteger)component
{
     if (pickerView.tag == 0){
        NSString *resultString1 = _subDiseasesArr[row];
        DebugLog(@"The selected Main Disease is: %@", resultString1);
    }
    else if (pickerView.tag == 1){
        NSString *resultString2 = _ageGroupArr[row];
        DebugLog(@"The selected Main Disease is: %@", resultString2);
    }
}

-(IBAction)addDisease:(id)sender{
  //  [[self.navigationController topViewController] dismissViewControllerAnimated:NO completion:Nil];
}

@end
