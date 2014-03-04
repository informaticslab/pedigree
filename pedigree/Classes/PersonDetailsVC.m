//
//  PersonDetailsVC.m
//  pedigree
//
//  Created by  Madhavi Tammineni on 1/23/14.
//  Copyright (c) 2014 CDC Informatics R&D Lab. All rights reserved.
//

#import "PersonDetailsVC.h"
#import "Person.h"
#import "PersonalInfoTVC.h"
#import "HealthInfoTVC.h"
#import "RelativesTableVC.h"
#import "FamilyBackgroundTVC.h"
#import "HealthInfoVC.h"
#import "Disease.h"
#import "ContractedDisease.h"
#import "RelationshipUtil.h"
#import "CustomCamera.h"

@interface PersonDetailsVC ()

@property (weak, nonatomic) IBOutlet UIView *personalInfoView;
@property (weak, nonatomic) IBOutlet UIView *healthInfoView;
@property (weak, nonatomic) IBOutlet UIView *familyBackgroundView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segControl;

- (IBAction)segControlValueChange:(id)sender;
- (IBAction)saveRelation:(id)sender;

@end

PersonalInfoTVC *personalInfoTVC;
HealthInfoVC *healthInfoVC;
FamilyBackgroundTVC *familyBackgroundTVC;
RelativesTableVC *relativesTVC;
RelationshipUtil *relUtil;
CustomCamera *cameraController;

@implementation PersonDetailsVC

AppManager *appMgr;
@synthesize txtFirstName;
@synthesize txtLastName;
@synthesize profileImgBtn;
@synthesize relative;
@synthesize selectedRelationId;
@synthesize myself;
@synthesize editingMode;

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
    self.navigationItem.hidesBackButton = YES;
    
    self.profileImgBtn.layer.cornerRadius = self.profileImgBtn.bounds.size.width/2.0;
    self.profileImgBtn.layer.borderWidth = 1;
    self.profileImgBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.profileImgBtn.layer.masksToBounds = YES;

    self.txtFirstName.autocapitalizationType = UITextAutocapitalizationTypeWords;
    self.txtLastName.autocapitalizationType = UITextAutocapitalizationTypeWords;
   
    _segControl.selectedSegmentIndex = 0;
    self.personalInfoView.hidden = NO;
    self.healthInfoView.hidden = YES;
    self.familyBackgroundView.hidden = YES;
    
    relUtil = [[RelationshipUtil alloc] init];
    
    if (editingMode == NO) {
        [self displayRelativeData:relative];
    }
    else if ( editingMode == YES){
        
        if (myself) {
            personalInfoTVC.lblRelationship.text = @"Myself";
            personalInfoTVC.lblGender.text = @"";
            self.navigationItem.title = @"Me";
        }
        else {
            personalInfoTVC.lblRelationship.text = [relUtil relationshipNameForRelationshipId:selectedRelationId];
            personalInfoTVC.lblGender.text = [relUtil genderForRelation:self.selectedRelationId];
            self.navigationItem.title = [relUtil relationshipNameForRelationshipId:selectedRelationId];
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)segControlValueChange:(id)sender {
    
    [self.txtFirstName resignFirstResponder];
    [self.txtLastName resignFirstResponder];
    
    if (_segControl.selectedSegmentIndex == 0) {
        self.personalInfoView.hidden = NO;
        self.healthInfoView.hidden = YES;
        self.familyBackgroundView.hidden = YES;
    }
    else if (_segControl.selectedSegmentIndex == 1) {
        self.personalInfoView.hidden = YES;
        self.healthInfoView.hidden = NO;
        self.familyBackgroundView.hidden = YES;
    }
    else if (_segControl.selectedSegmentIndex == 2) {
        self.personalInfoView.hidden = YES;
        self.healthInfoView.hidden = YES;
        self.familyBackgroundView.hidden = NO;
    }

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [self.txtFirstName resignFirstResponder];
    [self.txtLastName resignFirstResponder];
    
    if([segue.identifier isEqualToString:@"embedPersonalInfoTV"])
    {
        personalInfoTVC = (PersonalInfoTVC *)segue.destinationViewController;
        personalInfoTVC.relative = self.relative;
        personalInfoTVC.lblRelationship.text = [relUtil relationshipNameForRelationshipId:selectedRelationId];
    }
    if([segue.identifier isEqualToString:@"embedHealthInfoView"])
    {
        healthInfoVC = (HealthInfoVC *)segue.destinationViewController;
        healthInfoVC.relative = self.relative;
    }
    if([segue.identifier isEqualToString:@"embedFamilyInfoTVC"])
    {
        familyBackgroundTVC = (FamilyBackgroundTVC *)segue.destinationViewController;
       // familyBackgroundTVC.relative = self.me;
    }
 }

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"Tocuhes began with event:");
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
     return YES;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
}

-(BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    return YES;
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
}

-(BOOL)textFieldShouldClear:(UITextField *)textField{
    return YES;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)saveRelation:(id)sender
{
    if (editingMode == NO) {
        // do not save the data - view only mode
      /*  if ([APP_MGR.managedObjectContext hasChanges]) {
            
            NSError *error;
            if(! [APP_MGR.managedObjectContext save:&error]){
                DebugLog(@"User data could not be updated");
            }
        }*/
    }
    else {
        if (([txtFirstName.text  isEqual: @""]) || ([txtLastName.text  isEqual: @""])){
            
            [self validateInput];
        }
        else if((![txtFirstName.text  isEqual: @""]) && (![txtLastName.text  isEqual: @""])){
            
            Relative *_newRelative;
            
            if (_newRelative == nil) {
                _newRelative = [NSEntityDescription insertNewObjectForEntityForName:@"Relative" inManagedObjectContext:APP_MGR.managedObjectContext ];
            }
            
            NSData *profileImgData = UIImagePNGRepresentation(profileImgBtn.imageView.image);
            _newRelative.profileImage = profileImgData;
            
            _newRelative.firstName = txtFirstName.text;
            _newRelative.lastName = txtLastName.text;
           
            _newRelative.relationDescription = personalInfoTVC.lblRelationship.text;
            _newRelative.dateOfBirth = personalInfoTVC.selectedBirthDate;
            _newRelative.isLiving = [NSNumber numberWithBool:personalInfoTVC.isLiving];
            _newRelative.gender = [NSNumber numberWithInteger:personalInfoTVC.gender];
            _newRelative.isTwin = [NSNumber numberWithBool:personalInfoTVC.isTwin];
            _newRelative.isIdenticalTwin = [NSNumber numberWithBool:personalInfoTVC.isIdenticalTwin];
            _newRelative.isAdopted = [NSNumber numberWithBool:personalInfoTVC.isAdopted];
            
            _newRelative.areParentsRelatedOtherThanMarraige = [NSNumber numberWithBool:familyBackgroundTVC.areParentsRelatedOtherThanMarriage];
            _newRelative.race = [NSNumber numberWithInteger:familyBackgroundTVC.selectedRaces];
            _newRelative.ethnicity = [NSNumber numberWithInteger:familyBackgroundTVC.selectedEthnicities];
            
            _newRelative.height = [NSNumber numberWithDouble:5.2];
            _newRelative.weight = [NSNumber numberWithInt:120];
            
            for (Disease *dis in healthInfoVC.arrDiseases) {
                
                ContractedDisease *contractedDis = [NSEntityDescription insertNewObjectForEntityForName:@"ContractedDisease"inManagedObjectContext:APP_MGR.managedObjectContext ];
                
                contractedDis.categoryName = dis.categoryName;
                contractedDis.name = dis.name;
                contractedDis.ageAtDiagnosis = dis.ageAtDiagnosis;
                
                [_newRelative addContractedDiseaseObject:contractedDis];
            }
            
            NSError *error = nil;
            [APP_MGR.managedObjectContext save:&error];
            
            if (error)
            {
                DebugLog(@"Problem saving the relative: %@", error);
            }
        }
    }
    
    [self performSegueWithIdentifier:@"showRelativesSegue" sender:self];
}

-(void)validateInput
{
    NSString *alertMsg = @"Please provide ";
    BOOL msgFlag = NO;
    //first name, last name and relation
    if ([txtFirstName.text  isEqual: @""]) {
        msgFlag = YES;
        alertMsg = [alertMsg stringByAppendingString:@"First Name, "];
    }
    if ([txtLastName.text  isEqual: @""]) {
        msgFlag = YES;
        alertMsg = [alertMsg stringByAppendingString:@"Last Name "];
    }
    
    alertMsg = [alertMsg stringByAppendingString:@"to add a relative"];
    
    if (msgFlag == YES) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Missing Data" message:alertMsg delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alertView show];
    }
}

-(void)displayRelativeData:(Relative *)currRelative
{
    self.navigationItem.title = relative.relationDescription;
    
    //setting the relative's details from the database
    txtFirstName.text = relative.firstName;
    txtLastName.text = relative.lastName;
    [profileImgBtn setImage:[UIImage imageWithData:relative.profileImage] forState:UIControlStateNormal];
    
    [personalInfoTVC displayRelativeData:currRelative];
    [healthInfoVC displayRelativeData:currRelative];
 //   [familyBackgroundTVC displayRelativeData:currRelative];
}

-(IBAction)imageBtn_Clicked:(id)sender
{
    UIActionSheet *asImageOptionsView = [[UIActionSheet alloc] initWithTitle:@"" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Take Photo", @"Choose Existing", nil];
    [asImageOptionsView setBounds:CGRectMake(0, 0, 320, 500)];
    [asImageOptionsView showInView:self.view];
   
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        
        //Take new photo
        [self launchCamera];
    }
    else if(buttonIndex == 1){
        
        // Choose from the existing photo
        [self useCameraRoll];
    }
    else
    {
        //do nothing
    }
}

- (void) launchCamera {
	
	// Set up the camera
	cameraController = [[CustomCamera alloc] init];
	cameraController.sourceType = UIImagePickerControllerSourceTypeCamera;
	cameraController.delegate = self;
	
	cameraController.showsCameraControls = NO;
	cameraController.navigationBarHidden = YES;
	cameraController.toolbarHidden = YES;
	
	// overlay on top of camera lens view
	UIImageView *cameraOverlayView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"camera_overlay.png"]];
	cameraOverlayView.alpha = 0.0f;
	cameraController.cameraOverlayView = cameraOverlayView;
	
	// animate the fade in after the shutter opens
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDelay:2.2f];
	cameraOverlayView.alpha = 1.0f;
	[UIView commitAnimations];
	
	[self presentViewController:cameraController animated:YES completion:nil];
}

-(void)useCameraRoll
{
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum])
    {
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
        imagePicker.delegate = self;
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        imagePicker.allowsEditing = NO;
        
        [self presentViewController:imagePicker animated:YES completion:nil];
    }
}

// User took an image
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)inImage
				  editingInfo:(NSDictionary *)editingInfo {

	[profileImgBtn setImage:inImage forState:UIControlStateNormal];
    [profileImgBtn setImage:inImage forState:UIControlStateHighlighted];
    [profileImgBtn setImage:inImage forState:UIControlStateSelected];
	
	// Get rid of the picker interface
	[picker dismissModalViewControllerAnimated:YES];
}

@end
