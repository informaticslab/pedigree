//
//  DiseaseSubCategoryVCViewController.h
//  pedigree
//
//  Created by Murali Tammineni on 1/30/14.
//  Copyright (c) 2014 CDC Informatics R&D Lab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContractedDisease.h"

@interface DiseaseSubCategoryVCViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic) NSNumber *_mainDiseaseId;
@property (nonatomic, strong) NSMutableSet *setSelectedDiseases;
@property (nonatomic) NSInteger _checkboxSelections;

@end
