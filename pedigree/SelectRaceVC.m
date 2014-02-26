//
//  SelectRaceVC.m
//  pedigree
//
//  Created by Madhavi Tammineni on 2/5/14.
//  Copyright (c) 2014 CDC Informatics R&D Lab. All rights reserved.
//

#import "SelectRaceVC.h"
#import "RaceUtil.h"

@interface SelectRaceVC ()

@property (nonatomic, weak) IBOutlet UITableView *tblView;
@property (nonatomic, strong) RaceUtil *raceUtil;

@property (nonatomic, strong) NSArray *raceMainArr;
@property (nonatomic, strong) NSArray *raceAmericanIndianOrAlaskanNativeArr;
@property (nonatomic, strong) NSArray *raceAsianArr;
@property (nonatomic, strong) NSArray *raceBlackAfricanOrAmericanArr;
@property (nonatomic, strong) NSArray *raceNativeHawaiianArr;
@property (nonatomic, strong) NSArray *raceWhiteArr;

@end

@implementation SelectRaceVC

@synthesize _checkboxSelections;
@synthesize setSelectedRaces;

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
    _raceUtil = [[RaceUtil alloc] init];
   
    //initializing all the race arrays
    _raceMainArr = [[NSArray alloc] initWithArray:_raceUtil.raceMainCategoryArr];
    _raceAmericanIndianOrAlaskanNativeArr = [[NSArray alloc] initWithArray:_raceUtil.raceAmericanIndianOrAlaskanNativeArr];
    _raceAsianArr = [[NSArray alloc] initWithArray:_raceUtil.raceAsianArr];
    _raceBlackAfricanOrAmericanArr = [[NSArray alloc] initWithArray:_raceUtil.raceBlackAfricanOrAmericanArr];
    _raceNativeHawaiianArr = [[NSArray alloc] initWithArray:_raceUtil.raceNativeHawaiianArr];
    _raceWhiteArr =  [[NSArray alloc] initWithArray:_raceUtil.raceWhiteArr];
    
    _checkboxSelections = 0;
    
    setSelectedRaces = [[NSMutableSet alloc] init];
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
    return 40;
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
    
    
    switch (indexPath.section)
    {
        case kAmericanIndianOrAlaskanNative:{
            cell.textLabel.text = [_raceAmericanIndianOrAlaskanNativeArr objectAtIndex:indexPath.row];
            
            NSInteger temp = kAmericanIndianOrAlaskanNative;
            int flag = (1 << (temp + indexPath.row));
            // update row's accessory if it's "turned on"
            if (_checkboxSelections & flag)
            {
                cell.accessoryType = UITableViewCellAccessoryCheckmark;
                [setSelectedRaces addObject:cell.textLabel.text];
            }
            break;
        }
        case kAsian:{
            cell.textLabel.text = [_raceAsianArr objectAtIndex:indexPath.row];
           
            NSInteger temp = [_raceAmericanIndianOrAlaskanNativeArr count];
            int flag = (1 << (temp + indexPath.row));
            // update row's accessory if it's "turned on"
            if (_checkboxSelections & flag)
            {
                cell.accessoryType = UITableViewCellAccessoryCheckmark;
                [setSelectedRaces addObject:cell.textLabel.text];
            }
            break;
        }
            
        case kBlackAfricanOrAmerican:{
            cell.textLabel.text = [_raceBlackAfricanOrAmericanArr objectAtIndex:indexPath.row];
            
            NSInteger temp = [_raceAmericanIndianOrAlaskanNativeArr count] + [_raceAsianArr count];
            int flag = (1 << (temp + indexPath.row));
            // update row's accessory if it's "turned on"
            if (_checkboxSelections & flag)
            {
                cell.accessoryType = UITableViewCellAccessoryCheckmark;
                [setSelectedRaces addObject:cell.textLabel.text];
            }
            break;
        }
        case kNativeHawaiianOrOtherPacificIslander:{
            cell.textLabel.text = [_raceNativeHawaiianArr objectAtIndex:indexPath.row];
            
             NSInteger temp = [_raceAmericanIndianOrAlaskanNativeArr count] + [_raceAsianArr count] + [_raceBlackAfricanOrAmericanArr count];
            int flag = (1 << (temp + indexPath.row));
            // update row's accessory if it's "turned on"
            if (_checkboxSelections & flag)
            {
                cell.accessoryType = UITableViewCellAccessoryCheckmark;
                [setSelectedRaces addObject:cell.textLabel.text];
            }
            break;

        }
        case kWhite:{
            cell.textLabel.text = [_raceWhiteArr objectAtIndex:indexPath.row];
            
             NSInteger temp = [_raceAmericanIndianOrAlaskanNativeArr count] + [_raceAsianArr count] + [_raceBlackAfricanOrAmericanArr count] + [_raceNativeHawaiianArr count];
            int flag = (1 << (temp + indexPath.row));
            // update row's accessory if it's "turned on"
            if (_checkboxSelections & flag)
            {
                cell.accessoryType = UITableViewCellAccessoryCheckmark;
                [setSelectedRaces addObject:cell.textLabel.text];
            }
            break;
        }
        default:
            break;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section)
    {
        case kAmericanIndianOrAlaskanNative:
        {
            NSInteger temp = kAmericanIndianOrAlaskanNative;
            _checkboxSelections ^= (1 << (temp + indexPath.row));
            break;
        }
        case kAsian:
        {
            NSInteger temp = [_raceAmericanIndianOrAlaskanNativeArr count];
            _checkboxSelections ^= (1 << (temp + indexPath.row));
            break;
        }
        case kBlackAfricanOrAmerican:
        {
            NSInteger temp = [_raceAmericanIndianOrAlaskanNativeArr count] + [_raceAsianArr count];
            _checkboxSelections ^= (1 << (temp + indexPath.row));
            break;
        }
        case kNativeHawaiianOrOtherPacificIslander:
        {
            NSInteger temp = [_raceAmericanIndianOrAlaskanNativeArr count] + [_raceAsianArr count] + [_raceBlackAfricanOrAmericanArr count];
            _checkboxSelections ^= (1 << (temp + indexPath.row));
            break;
        }
        case kWhite:
        {
             NSInteger temp = [_raceAmericanIndianOrAlaskanNativeArr count] + [_raceAsianArr count] + [_raceBlackAfricanOrAmericanArr count] + [_raceNativeHawaiianArr count];
            _checkboxSelections ^= (1 << (temp + indexPath.row));
            break;
        }
        default:
            break;
    }
    [self.tblView reloadData];
}
 
@end
