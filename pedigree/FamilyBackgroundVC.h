//
//  FamilyBackgroundVC.h
//  pedigree
//
//  Created by Murali Tammineni on 1/31/14.
//  Copyright (c) 2014 CDC Informatics R&D Lab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Relative.h"

@interface FamilyBackgroundVC : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, weak) Relative *relative;
@end
