//
//  PersonDetailsVC.h
//  pedigree
//
//  Created by  Madhavi Tammineni on 1/23/14.
//  Copyright (c) 2014 CDC Informatics R&D Lab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h> 
#import "MainTabBarVC.h"
#import "HealthInfoVC.h"
#import "Relative.h"
#import <QuartzCore/QuartzCore.h>

@interface PersonDetailsVC : UIViewController<UITextFieldDelegate, UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
{
     UITextField *txtFirstName;
     UITextField *txtLastName;
     UITextField *txtTest;
}
@property (nonatomic, weak) Relative *relative;
@property (nonatomic, strong) MainTabBarVC *mainTabBarVC;
@property (nonatomic, strong) IBOutlet UITextField *txtFirstName;
@property (nonatomic, strong) IBOutlet UITextField *txtLastName;
@property (nonatomic, weak) IBOutlet UIButton *profileImgBtn;

@property (nonatomic) NSInteger selectedRelationId;
@property (nonatomic) BOOL myself;
@property (nonatomic) BOOL editingMode;

-(void)displayRelativeData:(Relative *)currRelative;

@end
