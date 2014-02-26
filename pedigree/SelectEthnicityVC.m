//
//  SelectEthnicityVC.m
//  pedigree
//
//  Created by Murali Tammineni on 2/7/14.
//  Copyright (c) 2014 CDC Informatics R&D Lab. All rights reserved.
//

#import "SelectEthnicityVC.h"
#import "EthnicityUtil.h"

@interface SelectEthnicityVC ()

@property (nonatomic, weak) IBOutlet UITableView *tblView;
@property (nonatomic, strong) EthnicityUtil *ethnicityUtil;

@property (nonatomic, strong) NSArray *ethnicityMainArr;
@property (nonatomic, strong) NSArray *ethnicityHispanicOrLatinoArr;
@property (nonatomic, strong) NSArray *ethnicityAshkenaziJewishArr;
@property (nonatomic, strong) NSArray *ethnicityNotHispanicOrLatinoArr;

@end

@implementation SelectEthnicityVC

@synthesize _checkboxSelections;
@synthesize setSelectedEthnicities;

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
    
     _ethnicityUtil = [[EthnicityUtil alloc] init];
    
    //initializing all the ethnicity arrays
    _ethnicityMainArr = [[NSArray alloc] initWithArray:_ethnicityUtil.ethnicityMainCategoryArr];
    _ethnicityHispanicOrLatinoArr = [[NSArray alloc] initWithArray:_ethnicityUtil.ethnicityHispanicOrLatinoCategoryArr];
    _ethnicityAshkenaziJewishArr = [[NSArray alloc] initWithArray:_ethnicityUtil.ethnicityAshkenaziJewishCategoryArr];
    _ethnicityNotHispanicOrLatinoArr = [[NSArray alloc] initWithArray:_ethnicityUtil.ethnicityNotHispanicOrLatinoCategoryArr];
    
    setSelectedEthnicities = [[NSMutableSet alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [_ethnicityMainArr count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *sectionName;
    switch (section)
    {
        case kHispanicOrLatino:
            sectionName = [_ethnicityMainArr objectAtIndex:kHispanicOrLatino];
            break;
        case kAshkenaziJewish:
            sectionName = [_ethnicityMainArr objectAtIndex:kAshkenaziJewish];
            break;
        case kNotHispanicOrLatino:
            sectionName = [_ethnicityMainArr objectAtIndex:kNotHispanicOrLatino];
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
        case kHispanicOrLatino:
            rowsInSection = [_ethnicityHispanicOrLatinoArr count];
            break;
        case kAshkenaziJewish:
            rowsInSection = [_ethnicityAshkenaziJewishArr count];
            break;
        case kNotHispanicOrLatino:
            rowsInSection = [_ethnicityNotHispanicOrLatinoArr count];
            break;
        default:
            break;
    }

    return rowsInSection;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"EthnicityCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryNone;
    
    
    switch (indexPath.section)
    {
        case kHispanicOrLatino:{
            cell.textLabel.text = [_ethnicityHispanicOrLatinoArr objectAtIndex:indexPath.row];
            
            NSInteger temp = kHispanicOrLatino;
            int flag = (1 << (temp + indexPath.row));
            // update row's accessory if it's "turned on"
            if (_checkboxSelections & flag)
            {
                cell.accessoryType = UITableViewCellAccessoryCheckmark;
                [setSelectedEthnicities addObject:cell.textLabel.text];
            }
            break;
        }
        case kAshkenaziJewish:{
            cell.textLabel.text = [_ethnicityAshkenaziJewishArr objectAtIndex:indexPath.row];
            
            NSInteger temp = [_ethnicityHispanicOrLatinoArr count];
            int flag = (1 << (temp + indexPath.row));
            // update row's accessory if it's "turned on"
            if (_checkboxSelections & flag)
            {
                cell.accessoryType = UITableViewCellAccessoryCheckmark;
                [setSelectedEthnicities addObject:cell.textLabel.text];
            }
            break;
        }
        case kNotHispanicOrLatino:{
            cell.textLabel.text = [_ethnicityNotHispanicOrLatinoArr objectAtIndex:indexPath.row];
            
            NSInteger temp = [_ethnicityHispanicOrLatinoArr count] + [_ethnicityAshkenaziJewishArr count];
            int flag = (1 << (temp + indexPath.row));
            // update row's accessory if it's "turned on"
            if (_checkboxSelections & flag)
            {
                cell.accessoryType = UITableViewCellAccessoryCheckmark;
                [setSelectedEthnicities addObject:cell.textLabel.text];
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
        case kHispanicOrLatino:
        {
            NSInteger temp = kHispanicOrLatino;
            _checkboxSelections ^= (1 << (temp + indexPath.row));
            break;
        }
        case kAshkenaziJewish:
        {
            NSInteger temp = [_ethnicityHispanicOrLatinoArr count];
            _checkboxSelections ^= (1 << (temp + indexPath.row));
            break;
        }
        case kNotHispanicOrLatino:
        {
            NSInteger temp = [_ethnicityHispanicOrLatinoArr count] + [_ethnicityAshkenaziJewishArr count];
            _checkboxSelections ^= (1 << (temp + indexPath.row));
            break;
        }
        default:
            break;
    }
    [self.tblView reloadData];
}


@end
