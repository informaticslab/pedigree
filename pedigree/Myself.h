//
//  Myself.h
//  pedigree
//
//  Created by jtq6 on 9/24/13.
//  Copyright (c) 2013 CDC Informatics R&D Lab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Myself : NSManagedObject

@property (nonatomic, retain) NSSet *relatives;
@end

@interface Myself (CoreDataGeneratedAccessors)

- (void)addRelativesObject:(NSManagedObject *)value;
- (void)removeRelativesObject:(NSManagedObject *)value;
- (void)addRelatives:(NSSet *)values;
- (void)removeRelatives:(NSSet *)values;

@end
