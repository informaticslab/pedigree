//
//  SelectDiseaseVC.h
//  pedigree
//
//  Created by Madhavi Tammineni on 1/29/14.
//  Copyright (c) 2014 CDC Informatics R&D Lab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectDiseaseVC : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableSet *setSelectedDiseases;
@property (nonatomic) NSInteger _checkboxSelections;

@end
