//
//  SelectAgeVC.h
//  pedigree
//
//  Created by Murali Tammineni on 2/10/14.
//  Copyright (c) 2014 CDC Informatics R&D Lab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Disease.h"

@interface SelectAgeVC : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, strong) Disease *selectedDisease;

@end
