//
//  SelectRaceVC.h
//  pedigree
//
//  Created by Madhavi Tammineni on 2/5/14.
//  Copyright (c) 2014 CDC Informatics R&D Lab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectRaceVC :  UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic) NSInteger _checkboxSelections;
@property (nonatomic, strong) NSMutableSet *setSelectedRaces;

@end
