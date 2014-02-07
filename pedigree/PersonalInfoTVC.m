//
//  RelativeDetailsTableVC.m
//  pedigree
//
//  Created by jtq6 on 10/21/13.
//  Copyright (c) 2013 CDC Informatics R&D Lab. All rights reserved.
//

#import "PersonalInfoTVC.h"
#import "SelectBirthdateVC.h"

@implementation PersonalInfoTVC

@synthesize switchLiving;
@synthesize switchTwin;
@synthesize switchIdenticalTwin;
@synthesize switchAdopted;

@synthesize lblRelationship;
@synthesize lblGender;
@synthesize selectRelationshipTVC;
@synthesize customView;

@synthesize isLiving;
@synthesize isTwin;
@synthesize isIdenticalTwin;
@synthesize isAdopted;

NSArray *arrGender;

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
  //  _lblRelationship.text = _relative.relationDescription;
    
    [switchLiving addTarget:self action:@selector(switchValueChanged:) forControlEvents:UIControlEventValueChanged];
    [switchTwin addTarget:self action:@selector(switchValueChanged:) forControlEvents:UIControlEventValueChanged];
    [switchIdenticalTwin addTarget:self action:@selector(switchValueChanged:) forControlEvents:UIControlEventValueChanged];
    [switchAdopted addTarget:self action:@selector(switchValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    arrGender = [[NSArray alloc] initWithObjects:@"Male", @"Female", nil];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 1) {
        NSLog(@":: Displaying the gender action sheet ::");
        [self displayGenderPicker];
    }
}

- (IBAction)dismissWithDoneBirthdateVC:(UIStoryboardSegue *)segue {
     NSLog(@"dismissWithDoneBirthdateVC");
    
    SelectBirthdateVC *birthdateVC = segue.sourceViewController;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM-dd-yyyy"];
    
    NSDate *date = [birthdateVC.datePicker date];
    
    self.lblBirthdate.text = [dateFormatter stringFromDate:date];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.tableView reloadData];
}

- (IBAction)dismissWithCancelBirthdateVC:(UIStoryboardSegue *)segue {
    NSLog(@"dismissWithCancelBirthdateVC");
    SelectBirthdateVC *birthdateVC = segue.sourceViewController;
    [birthdateVC dismissViewControllerAnimated:YES completion:nil];

}

- (IBAction)dismissWithDoneRelationshipVC:(UIStoryboardSegue *)segue {
    SelectRelationshipVC *relationshipVC = segue.sourceViewController;
    self.lblRelationship.text = relationshipVC.relDescription;
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

- (void)switchValueChanged:(id)sender{

    if([sender tag] == 0){
        
        if ([sender isOn]) {
            isLiving = YES;
        }
        else{
            isLiving = NO;
        }
        
    }
    else if ([sender tag] == 1){
        
        if ([sender isOn]) {
           isTwin = YES;
        }
        else{
            isTwin = NO;
        }
    }
    else if ([sender tag] == 2){
        
        if ([sender isOn]) {
            isIdenticalTwin = YES;
        }
        else{
            isIdenticalTwin = NO;
        }
    }
    else if ([sender tag] == 3){
        
        if ([sender isOn]) {
            isAdopted = YES;
        }
        else{
            isAdopted = NO;
        }
        
    }
    else{
        // do nothing
    }
    
}

-(void)displayGenderPicker{
    
    UIActionSheet *asGenderView = [[UIActionSheet alloc] initWithTitle:@"Gender" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Male", @"Female", nil];
    [asGenderView setBounds:CGRectMake(0, 0, 320, 500)];
    
    [asGenderView showInView:self.view];
}


-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex == 0) {
        lblGender.text = [arrGender objectAtIndex:buttonIndex];
    }
    else if (buttonIndex == 1) {
        lblGender.text = [arrGender objectAtIndex:buttonIndex];
    }
    else{
        // do nothing
    }
}

@end
