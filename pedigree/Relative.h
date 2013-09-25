//
//  Relative.h
//  pedigree
//
//  Created by jtq6 on 9/24/13.
//  Copyright (c) 2013 CDC Informatics R&D Lab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Person.h"

@class Myself;

@interface Relative : Person

@property (nonatomic, retain) NSNumber * relationId;
@property (nonatomic, retain) NSString * relationDescription;
@property (nonatomic, retain) Myself *myself;

@end
