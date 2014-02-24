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

@interface PersonDetailsVC : UIViewController<UITextFieldDelegate>
{
     UITextField *txtFirstName;
     UITextField *txtLastName;
     UITextField *txtTest;
}
@property(nonatomic, weak) Relative *relative;
@property(nonatomic, strong) MainTabBarVC *mainTabBarVC;
@property (nonatomic, strong) IBOutlet UITextField *txtFirstName;
@property (nonatomic, strong) IBOutlet UITextField *txtLastName;
@property (nonatomic, strong) UITextField *txtTest;
@property (nonatomic) NSInteger selectedRelationId;

@property (nonatomic) BOOL myself;
@property (nonatomic) BOOL editingMode;

-(void)displayRelativeData:(Relative *)currRelative;

@end
