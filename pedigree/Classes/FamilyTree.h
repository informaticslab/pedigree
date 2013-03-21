//
//  FamilyTree.h
//  pedigree
//
//  Created by jtq6 on 3/21/13.
//  Copyright (c) 2013 CDC Informatics R&D Lab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FamilyMember.h"

@interface FamilyTree : NSObject

@property (nonatomic, strong) NSMutableArray *famTree;

-(void)loadTestData;
-(NSInteger)numberOfRelatives;
-(FamilyMember *)relativeFromIndex:(NSInteger) index;


@end
