//
//  UILabel+Boldify.h
//  pedigree
//
//  Created by  Madhavi Tammineni on 1/24/14.
//  Copyright (c) 2014 CDC Informatics R&D Lab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Boldify)

-(void) boldSubstring: (NSString* ) substring;
-(void) boldRange: (NSRange) range;
@end
