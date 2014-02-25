//
//  SelectEthnicityVC.h
//  pedigree
//
//  Created by Murali Tammineni on 2/7/14.
//  Copyright (c) 2014 CDC Informatics R&D Lab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectEthnicityVC : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic) NSInteger _checkboxSelections;
@property (nonatomic, strong) NSMutableSet *setSelectedEthnicities;

@end
