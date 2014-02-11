//
//  FamilyTree.h
//  pedigree
//
//  Created by jtq6 on 3/21/13.
//  Copyright (c) 2013 CDC Informatics R&D Lab. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Relative;
@interface FamilyTree : NSObject

@property (nonatomic, strong) NSMutableArray *famTree;

-(void)loadTestData;
-(NSInteger)numberOfRelatives;
-(Relative *)relativeFromIndex:(NSInteger) index;

@end
