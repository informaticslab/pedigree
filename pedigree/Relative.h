//
//  Relative.h
//  pedigree
//
//  Created by Murali Tammineni on 2/5/14.
//  Copyright (c) 2014 CDC Informatics R&D Lab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Person.h"

@class Myself;

@interface Relative : Person

@property (nonatomic, retain) NSString * relationDescription;
@property (nonatomic, retain) NSNumber * relationId;
@property (nonatomic, retain) Myself *myself;

@end
