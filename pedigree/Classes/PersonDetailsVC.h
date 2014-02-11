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
#import "Relative.h"

@interface PersonDetailsVC : UIViewController<UITextFieldDelegate>
{
     UITextField *txtFirstName;
     UITextField *txtLastName;
     UITextField *txtTest;
}
@property(nonatomic, weak) Relative *me;
@property(nonatomic, strong) MainTabBarVC *mainTabBarVC;
@property (nonatomic, strong) IBOutlet UITextField *txtFirstName;
@property (nonatomic, strong) IBOutlet UITextField *txtLastName;
@property (nonatomic, strong) UITextField *txtTest;

@property (nonatomic, retain) NSMutableArray *arrContractedDiseases;

//-(IBAction)dismissKeyboardOnTap:(id)sender;
@end
