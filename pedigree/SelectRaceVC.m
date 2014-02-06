//
//  SelectRaceVC.m
//  pedigree
//
//  Created by Murali Tammineni on 2/5/14.
//  Copyright (c) 2014 CDC Informatics R&D Lab. All rights reserved.
//

#import "SelectRaceVC.h"
#import "RaceEthnicityUtil.h"

@interface SelectRaceVC ()

@property (nonatomic, weak) IBOutlet UITableView *tblView;
@property (nonatomic, strong) RaceEthnicityUtil *raceEthnicityUtil;

@property (nonatomic, strong) NSArray *raceMainArr;
@property (nonatomic, strong) NSArray *raceAmericanIndianOrAlaskanNativeArr;
@property (nonatomic, strong) NSArray *raceAsianArr;
@property (nonatomic, strong) NSArray *raceBlackAfricanOrAmericanArr;
@property (nonatomic, strong) NSArray *raceNativeHawaiianArr;
@property (nonatomic, strong) NSArray *raceWhiteArr;

@end

@implementation SelectRaceVC

NSInteger selectedIndex;
//NSInteger   _checkboxSelections;

NSInteger _checkboxSelectionsAmericanIndian;
NSInteger _checkboxSelectionsAsian;
NSInteger _checkboxSelectionsBlackAfricanAmerican;
NSInteger _checkboxSelectionsNativeHawaiian;
NSInteger _checkboxSelectionsWhite;

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
    _raceEthnicityUtil = [[RaceEthnicityUtil alloc] init];
   
    //initializing all the race arrays
    _raceMainArr = [[NSArray alloc] initWithArray:_raceEthnicityUtil.raceMainCategoryArr];
    _raceAmericanIndianOrAlaskanNativeArr = [[NSArray alloc] initWithArray:_raceEthnicityUtil.raceAmericanIndianOrAlaskanNativeArr];
    _raceAsianArr = [[NSArray alloc] initWithArray:_raceEthnicityUtil.raceAsianArr];
    _raceBlackAfricanOrAmericanArr = [[NSArray alloc] initWithArray:_raceEthnicityUtil.raceBlackAfricanOrAmericanArr];
    _raceNativeHawaiianArr = [[NSArray alloc] initWithArray:_raceEthnicityUtil.raceNativeHawaiianArr];
    _raceWhiteArr =  [[NSArray alloc] initWithArray:_raceEthnicityUtil.raceWhiteArr];
    
  //  _checkboxSelections = 0;
    
    _checkboxSelectionsAmericanIndian = 0;
    _checkboxSelectionsAsian = 0;
    _checkboxSelectionsBlackAfricanAmerican = 0;
    _checkboxSelectionsNativeHawaiian = 0;
    _checkboxSelectionsWhite = 0;
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [_raceMainArr count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 44;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *sectionName;
    switch (section)
    {
        case kAmericanIndianOrAlaskanNative:
            sectionName = [_raceMainArr objectAtIndex:kAmericanIndianOrAlaskanNative];
            break;
        case kAsian:
            sectionName = [_raceMainArr objectAtIndex:kAsian];
            break;
        case kBlackAfricanOrAmerican:
            sectionName = [_raceMainArr objectAtIndex:kBlackAfricanOrAmerican];
            break;
        case kNativeHawaiianOrOtherPacificIslander:
            sectionName = [_raceMainArr objectAtIndex:kNativeHawaiianOrOtherPacificIslander];
            break;
        case kWhite:
            sectionName = [_raceMainArr objectAtIndex:kWhite];
            break;
        default:
            break;
    }
    return sectionName;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
 
    NSInteger rowsInSection = 0;
    switch (section)
    {
        case kAmericanIndianOrAlaskanNative:
            rowsInSection = [_raceAmericanIndianOrAlaskanNativeArr count];
            break;
        case kAsian:
            rowsInSection = [_raceAsianArr count];
            break;
        case kBlackAfricanOrAmerican:
            rowsInSection = [_raceBlackAfricanOrAmericanArr count];
            break;
        case kNativeHawaiianOrOtherPacificIslander:
            rowsInSection = [_raceNativeHawaiianArr count];
            break;
        case kWhite:
            rowsInSection = [_raceWhiteArr count];
            break;
        default:
            break;
    }
    return rowsInSection;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"RaceCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryNone;
    
//    cell.textLabel.text = [_raceMainArr objectAtIndex:indexPath.row];
    switch (indexPath.section)
    {
        case kAmericanIndianOrAlaskanNative:{
            cell.textLabel.text = [_raceAmericanIndianOrAlaskanNativeArr objectAtIndex:indexPath.row];
            
            int flag = (1 << indexPath.row);
            // update row's accessory if it's "turned on"
            if (_checkboxSelectionsAmericanIndian & flag) cell.accessoryType = UITableViewCellAccessoryCheckmark;
            
            break;
        }
        case kAsian:{
            cell.textLabel.text = [_raceAsianArr objectAtIndex:indexPath.row];
            
            int flag = (1 << indexPath.row);
            // update row's accessory if it's "turned on"
            if (_checkboxSelectionsAsian & flag) cell.accessoryType = UITableViewCellAccessoryCheckmark;
            
            break;
        }
            
        case kBlackAfricanOrAmerican:{
            cell.textLabel.text = [_raceBlackAfricanOrAmericanArr objectAtIndex:indexPath.row];
            
            int flag = (1 << indexPath.row);
            // update row's accessory if it's "turned on"
            if (_checkboxSelectionsBlackAfricanAmerican & flag) cell.accessoryType = UITableViewCellAccessoryCheckmark;
            
            break;
        }
        case kNativeHawaiianOrOtherPacificIslander:{
            cell.textLabel.text = [_raceNativeHawaiianArr objectAtIndex:indexPath.row];
            
            int flag = (1 << indexPath.row);
            // update row's accessory if it's "turned on"
            if (_checkboxSelectionsNativeHawaiian & flag) cell.accessoryType = UITableViewCellAccessoryCheckmark;
            
            break;

        }
        case kWhite:{
            cell.textLabel.text = [_raceWhiteArr objectAtIndex:indexPath.row];
            
            int flag = (1 << indexPath.row);
            // update row's accessory if it's "turned on"
            if (_checkboxSelectionsWhite & flag) cell.accessoryType = UITableViewCellAccessoryCheckmark;
            
            break;
        }
        default:
            break;
    }

 /*   int flag = (1 << indexPath.row);
    // update row's accessory if it's "turned on"
    if (_checkboxSelections & flag) cell.accessoryType = UITableViewCellAccessoryCheckmark;
*/
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  
  /*  selectedIndex = indexPath.row;
    _checkboxSelections ^= (1 << indexPath.row);
   */
    
    
    switch (indexPath.section)
    {
        case kAmericanIndianOrAlaskanNative:
            _checkboxSelectionsAmericanIndian ^= (1 << indexPath.row);
            break;
        case kAsian:
            _checkboxSelectionsAsian ^= (1 << indexPath.row);
            break;
        case kBlackAfricanOrAmerican:
            _checkboxSelectionsBlackAfricanAmerican ^= (1 << indexPath.row);
            break;
        case kNativeHawaiianOrOtherPacificIslander:
            _checkboxSelectionsNativeHawaiian ^= (1 << indexPath.row);
            break;
        case kWhite:
            _checkboxSelectionsWhite ^= (1 << indexPath.row);
            break;
        default:
            break;
    }

    [self.tblView reloadData];
}
 
@end
