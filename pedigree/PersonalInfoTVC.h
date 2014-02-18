//
//  RelativeDetailsTableVC.h
//  pedigree
//
//  Created by jtq6 on 10/21/13.
//  Copyright (c) 2013 CDC Informatics R&D Lab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Relative.h"
#import "SelectRelationshipVC.h"

@interface PersonalInfoTVC : UITableViewController <UIActionSheetDelegate>
@property(nonatomic, weak) Relative *relative;
@property(nonatomic, weak) SelectRelationshipVC *selectRelationshipTVC;

@property (strong, nonatomic) IBOutlet UILabel *lblRelationship;
@property (weak, nonatomic) IBOutlet UILabel *lblBirthdate;
@property (weak, nonatomic) IBOutlet UILabel *lblLiving;
@property (weak, nonatomic) IBOutlet UILabel *lblTwin;
@property (weak, nonatomic) IBOutlet UILabel *lblAdopted;
@property (weak, nonatomic) IBOutlet UILabel *lblGender;

@property (weak, nonatomic) IBOutlet UISwitch *switchLiving;
@property (weak, nonatomic) IBOutlet UISwitch *switchTwin;
@property (weak, nonatomic) IBOutlet UISwitch *switchIdenticalTwin;
@property (weak, nonatomic) IBOutlet UISwitch *switchAdopted;

@property (strong, nonatomic) IBOutlet UIPickerView *customView;

@property (nonatomic, assign) BOOL isLiving;
@property (nonatomic) NSInteger gender;
@property (nonatomic, assign) BOOL isTwin;
@property (nonatomic, assign) BOOL isIdenticalTwin;
@property (nonatomic, assign) BOOL isAdopted;

-(void)displayGenderPicker;

@end
