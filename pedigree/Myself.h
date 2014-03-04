//
//  Myself.h
//  pedigree
//
//  Created by Murali Tammineni on 3/4/14.
//  Copyright (c) 2014 CDC Informatics R&D Lab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Person.h"

@class Relative;

@interface Myself : Person

@property (nonatomic, retain) NSSet *relatives;
@end

@interface Myself (CoreDataGeneratedAccessors)

- (void)addRelativesObject:(Relative *)value;
- (void)removeRelativesObject:(Relative *)value;
- (void)addRelatives:(NSSet *)values;
- (void)removeRelatives:(NSSet *)values;

@end
