//
//  PersonDetailsVC.h
//  pedigree
//
//  Created by  Madhavi Tammineni on 1/23/14.
//  Copyright (c) 2014 CDC Informatics R&D Lab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainTabBarVC.h"

@interface PersonDetailsVC : UIViewController<UITextFieldDelegate>

@property(nonatomic, weak) Relative *me;
@property(nonatomic, strong) MainTabBarVC *mainTabBarVC;
@end
