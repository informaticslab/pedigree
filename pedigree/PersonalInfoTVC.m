//
//  RelativeDetailsTableVC.m
//  pedigree
//
//  Created by jtq6 on 10/21/13.
//  Copyright (c) 2013 CDC Informatics R&D Lab. All rights reserved.
//

#import "PersonalInfoTVC.h"
#import "SelectBirthdateVC.h"
#import "RelationshipUtil.h"

@implementation PersonalInfoTVC

@synthesize tblView;
@synthesize lblRelationship;
@synthesize lblBirthdate;
@synthesize lblGender;
@synthesize lblLiving;
@synthesize lblAdopted;
@synthesize lblTwin;
@synthesize lblIdenticalTwin;

@synthesize selectRelationshipTVC;
@synthesize customView;

@synthesize isLiving;
@synthesize gender;
@synthesize isTwin;
@synthesize isIdenticalTwin;
@synthesize isAdopted;
@synthesize selectedBirthDate;

NSArray *arrGender;
NSArray *arrBoolean;
RelationshipUtil *relUtil;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
  
    arrGender = [[NSArray alloc] initWithObjects:@"Male", @"Female", nil];
    arrBoolean = [[NSArray alloc] initWithObjects:@"Yes", @"No", nil];
    
    relUtil = [[RelationshipUtil alloc] init];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 1:
            [self displayGenderPicker];
            break;
        case 2:
            [self displayBirthdatePicker];
            break;
        case 3:
            [self displayLivingPicker];
            break;
        case 4:
            [self displayAdoptionPicker];
            break;
        case 5:
            [self displayTwinPicker];
            break;
        case 6:
            [self displayIdenticalTwinPicker];
            break;
            
        default:
            break;
    }
}

/*
- (IBAction)dismissWithDoneBirthdateVC:(UIStoryboardSegue *)segue {
     NSLog(@"dismissWithDoneBirthdateVC");
    
    SelectBirthdateVC *birthdateVC = segue.sourceViewController;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM-dd-yyyy"];
    
    NSDate *date = [birthdateVC.datePicker date];
    selectedBirthDate = date;
    
    self.lblBirthdate.text = [dateFormatter stringFromDate:date];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.tableView reloadData];
}

- (IBAction)dismissWithCancelBirthdateVC:(UIStoryboardSegue *)segue {
    NSLog(@"dismissWithCancelBirthdateVC");
    SelectBirthdateVC *birthdateVC = segue.sourceViewController;
    [birthdateVC dismissViewControllerAnimated:YES completion:nil];
}
 */

- (IBAction)dismissWithDoneRelationshipVC:(UIStoryboardSegue *)segue {
    
    SelectRelationshipVC *relationshipVC = segue.sourceViewController;
    
    if (relationshipVC._selectedIndex >= 0) {
        self.lblRelationship.text = [relUtil relationshipNameForRelationshipId:relationshipVC._selectedIndex];
    }
    else
    {
      self.lblRelationship.text = @"Myself";
    }
    self.lblGender.text = [relUtil genderForRelation:relationshipVC._selectedIndex];
    [relationshipVC dismissViewControllerAnimated:YES completion:nil];
    
    [self.tableView reloadData];
    
}


- (IBAction)dismissWithCancelRelationshipVC:(UIStoryboardSegue *)segue {
    
    SelectRelationshipVC *relationshipVC = segue.sourceViewController;
    [relationshipVC dismissViewControllerAnimated:YES completion:nil];
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"showSelectRelationship"])
    {
        selectRelationshipTVC = segue.destinationViewController;
        selectRelationshipTVC.relative = _relative;
    }
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

#pragma mark - Display Gender Picker

-(void)displayGenderPicker{
    
    UIActionSheet *asGenderView = [[UIActionSheet alloc] initWithTitle:@"Gender" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Male", @"Female", nil];
    asGenderView.tag = 0;
    [asGenderView setBounds:CGRectMake(0, 0, 320, 500)];
    
    [asGenderView showInView:self.view];
}


-(void)displayLivingPicker{
    
    UIActionSheet *asLivingView = [[UIActionSheet alloc] initWithTitle:@"Is the relative living?" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Yes", @"No", nil];
    asLivingView.tag = 1;
    [asLivingView setBounds:CGRectMake(0, 0, 320, 500)];
    
    [asLivingView showInView:self.view];
}

-(void)displayAdoptionPicker{
    
    UIActionSheet *asAdoptionView = [[UIActionSheet alloc] initWithTitle:@"Is the relative adopted?" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Yes", @"No", nil];
    asAdoptionView.tag = 2;
    [asAdoptionView setBounds:CGRectMake(0, 0, 320, 500)];
    
    [asAdoptionView showInView:self.view];
}

-(void)displayTwinPicker{
    
    UIActionSheet *asTwinView = [[UIActionSheet alloc] initWithTitle:@"Is the relative twin?" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Yes", @"No", nil];
    asTwinView.tag = 3;
    [asTwinView setBounds:CGRectMake(0, 0, 320, 500)];
    
    [asTwinView showInView:self.view];
}

-(void)displayIdenticalTwinPicker{
    
    UIActionSheet *asIdenticalTwinView = [[UIActionSheet alloc] initWithTitle:@"Is the relative identical twin?" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Yes", @"No", nil];
    asIdenticalTwinView.tag = 4;
    [asIdenticalTwinView setBounds:CGRectMake(0, 0, 320, 500)];
    
    [asIdenticalTwinView showInView:self.view];
}


#define DatePickerTag 500
-(void)displayBirthdatePicker{
    
    UIActionSheet *asDateView = [[UIActionSheet alloc] initWithTitle:@"Birthdate" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Done", nil];
    asDateView.tag = 5;
    
    UIDatePicker *pickerView = [[UIDatePicker alloc] init];
    pickerView.datePickerMode = UIDatePickerModeDate;
    pickerView.tag = DatePickerTag;
    
    [asDateView addSubview:pickerView];
    [asDateView showInView:self.view];
    
    CGRect asRect = asDateView.frame;
    CGFloat orgHeight = asRect.size.height;
    asRect.origin.y -= 100;
    asRect.size.height = orgHeight + 100;
    asDateView.frame = asRect;
    
    CGRect pickerRect = pickerView.frame;
    pickerRect.origin.y = 30;
    pickerView.frame = pickerRect;
    
    NSArray *subViews = [asDateView subviews];
   
    CGRect doneBtnFrame = CGRectMake(240, 0, 75, 46);
    [[subViews objectAtIndex:2] setFrame:doneBtnFrame];
    
    CGRect cancelBtnFrame = CGRectMake(15, 0, 75, 46);
    [[subViews objectAtIndex:3] setFrame:cancelBtnFrame];
    
}


-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    switch (actionSheet.tag) {
        case 0:
        {
            if (buttonIndex == 0) {
                lblGender.text = [arrGender objectAtIndex:buttonIndex];
                gender = buttonIndex;
            }
            else if (buttonIndex == 1) {
                lblGender.text = [arrGender objectAtIndex:buttonIndex];
                gender = buttonIndex;
            }
            else{
                lblGender.text = @"";
                gender = -1;
            }
            break;
        }
        case 1:
        {
            if (buttonIndex == 0){
                lblLiving.text = [arrBoolean objectAtIndex:buttonIndex];
                isLiving = YES;
            }
            else if (buttonIndex == 1){
               lblLiving.text = [arrBoolean objectAtIndex:buttonIndex];
               isLiving = NO;
            }
            else{
               lblLiving.text = @"";
               isLiving = NO;
            }
            break;
        }
        case 2:
        {
            if (buttonIndex == 0){
                lblAdopted.text = [arrBoolean objectAtIndex:buttonIndex];
                isAdopted = YES;
            }
            else if (buttonIndex == 1){
                lblAdopted.text = [arrBoolean objectAtIndex:buttonIndex];
                isAdopted = NO;
            }
            else{
                lblAdopted.text = @"";
                isAdopted = NO;
            }
            break;
        }
        case 3:
        {
            if (buttonIndex == 0) {
                lblTwin.text = [arrBoolean objectAtIndex:buttonIndex];
                isTwin = YES;
                [self.tblView reloadData];
            }
            else if (buttonIndex == 1) {
                lblTwin.text = [arrBoolean objectAtIndex:buttonIndex];
                isTwin = NO;
            }
            else{
                lblTwin.text = @"";
                isTwin = NO;
            }
            break;
        }
        case 4:
        {
            if (buttonIndex == 0) {
                lblIdenticalTwin.text = [arrBoolean objectAtIndex:buttonIndex];
                isIdenticalTwin = YES;
            }
            else if (buttonIndex == 1) {
                lblIdenticalTwin.text = [arrBoolean objectAtIndex:buttonIndex];
                isIdenticalTwin = NO;
            }
            else{
               lblIdenticalTwin.text = @"";
                isIdenticalTwin = NO;
            }
            break;
        }
        case 5:
        {
            //select button is pressed
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"MM-dd-yyyy"];
                
            UIDatePicker *pickerView = (UIDatePicker *)[actionSheet viewWithTag:DatePickerTag];
            NSDate *date = [pickerView date];
            // selectedBirthDate = date;
            self.lblBirthdate.text = [dateFormatter stringFromDate:date];
         
            break;
        }
        default:
            break;
    }
    
}

-(void)displayRelativeData:(Relative *)currRelative
{
    lblRelationship.text = currRelative.relationDescription;
    lblGender.text = [arrGender objectAtIndex:currRelative.gender.integerValue];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM-dd-yyyy"];
    lblBirthdate.text = [dateFormatter stringFromDate:currRelative.dateOfBirth];
    
    if (currRelative.isLiving.boolValue == YES) {
        lblLiving.text = @"Yes";
    }
    else if (currRelative.isLiving.boolValue == NO) {
        lblLiving.text = @"No";
    }
    
    if (currRelative.isAdopted.boolValue == YES) {
        lblAdopted.text = @"Yes";
    }
    else if (currRelative.isAdopted.boolValue == NO) {
        lblAdopted.text = @"No";
    }
    
    if (currRelative.isTwin.boolValue == YES) {
        lblTwin.text = @"Yes";
    }
    else if (currRelative.isTwin.boolValue == NO) {
        lblTwin.text = @"No";
    }
    
    if (currRelative.isIdenticalTwin.boolValue == YES) {
        lblIdenticalTwin.text = @"Yes";
    }
    else if (currRelative.isIdenticalTwin.boolValue == NO) {
        lblIdenticalTwin.text = @"No";
    }
}

@end
