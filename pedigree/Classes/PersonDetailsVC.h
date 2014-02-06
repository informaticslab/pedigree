//
//  PersonDetailsVC.h
//  pedigree
//
//  Created by  Madhavi Tammineni on 1/23/14.
//  Copyright (c) 2014 CDC Informatics R&D Lab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainTabBarVC.h"
#import "HealthInfoVC.h"

@interface PersonDetailsVC : UIViewController<UITextFieldDelegate>

@property(nonatomic, weak) Relative *me;
@property(nonatomic, strong) MainTabBarVC *mainTabBarVC;

@property (strong, nonatomic) IBOutlet UITextField *txtFirstName;
@property (strong, nonatomic) IBOutlet UITextField *txtLastName;

@property (nonatomic, retain) NSMutableArray *arrContractedDiseases;

-(IBAction)dismissKeyboardOnTap:(id)sender;
@end
