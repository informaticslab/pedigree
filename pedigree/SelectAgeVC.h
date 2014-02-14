//
//  SelectAgeVC.h
//  pedigree
//
//  Created by Murali Tammineni on 2/10/14.
//  Copyright (c) 2014 CDC Informatics R&D Lab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectAgeVC : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic) NSInteger selectedAgeIndex;

@end
