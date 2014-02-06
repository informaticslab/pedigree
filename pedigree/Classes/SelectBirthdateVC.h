//
//  SelectBirthdateVC.h
//  pedigree
//
//  Created by jtq6 on 10/29/13.
//  Copyright (c) 2013 CDC Informatics R&D Lab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectBirthdateVC : UIViewController

@property (nonatomic, weak) NSDate *birthDate;
@property (nonatomic, weak) IBOutlet UIDatePicker *datePicker;
@property (nonatomic, weak) IBOutlet UILabel *dateLbl;

@end
