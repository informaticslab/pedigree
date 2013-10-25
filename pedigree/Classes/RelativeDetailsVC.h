//
//  RelativeDetailsVC.h
//  pedigree
//
//  Created by jtq6 on 9/26/13.
//  Copyright (c) 2013 CDC Informatics R&D Lab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Relative.h"
@interface RelativeDetailsVC :UIViewController

@property(nonatomic, weak) Relative *relative;

@property (weak, nonatomic) IBOutlet UITextField *txtFirstName;
@property (weak, nonatomic) IBOutlet UITextField *txtLastName;
@end
