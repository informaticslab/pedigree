//
//  HealthInfoVC.h
//  pedigree
//
//  Created by Madhavi Tammineni on 1/30/14.
//  Copyright (c) 2014 CDC Informatics R&D Lab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContractedDisease.h"
#import "PersonDetailsVC.h"
#import "ExistingConditionsCell.h"
#import "DiseasesUtil.h"

@class PersonDetailsVC;
@interface HealthInfoVC : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) Relative *relative;
@property (nonatomic, strong) NSMutableArray *arrDiseases;

-(void)displayRelativeData:(Relative *)currRelative;

@end
