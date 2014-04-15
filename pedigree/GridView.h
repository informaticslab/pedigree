//
//  GridView.h
//  pedigree
//
//  Created by Murali Tammineni on 3/11/14.
//  Copyright (c) 2014 CDC Informatics R&D Lab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>

@interface GridView : UIView

@property (nonatomic, retain) NSMutableArray *relatives;

- (void)display;

@end
