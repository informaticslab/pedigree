//
//  DiseaseSubCategoryVCViewController.h
//  pedigree
//
//  Created by Murali Tammineni on 1/30/14.
//  Copyright (c) 2014 CDC Informatics R&D Lab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DiseaseSubCategoryVCViewController : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic) NSNumber *_mainDiseaseId;

@end
