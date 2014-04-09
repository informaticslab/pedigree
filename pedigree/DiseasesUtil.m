//
//  DiseasesUtil.m
//  pedigree
//
//  Created by Murali Tammineni on 1/29/14.
//  Copyright (c) 2014 CDC Informatics R&D Lab. All rights reserved.
//

#import "DiseasesUtil.h"

@implementation DiseasesUtil

@synthesize mainDiseaseCategoryArr;
@synthesize subDiseaseCategoryArr;
@synthesize ageGroupArr;

- (id)init {
    if (self = [super init]) {
        ageGroupArr = [[NSArray alloc] initWithObjects:
                        @"Pre-Birth",@"Newborn",@"In Infancy",@"In Childhood",@"In Adolescence", @"20-29 years", @"30-39 years", @"40-49 years", @"50-59 years", @"60 years and older", @"Unknown",nil];
    }
    return self;
}

@end
