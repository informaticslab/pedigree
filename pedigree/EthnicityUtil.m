//
//  EthnicityUtil.m
//  pedigree
//
//  Created by Murali Tammineni on 2/7/14.
//  Copyright (c) 2014 CDC Informatics R&D Lab. All rights reserved.
//

#import "EthnicityUtil.h"

@implementation EthnicityUtil

@synthesize ethnicityMainCategoryArr;
@synthesize ethnicityHispanicOrLatinoCategoryArr;
@synthesize ethnicityAshkenaziJewishCategoryArr;
@synthesize ethnicityNotHispanicOrLatinoCategoryArr;

- (id)init {
    if (self = [super init]) {
        
        //initializing the object
        ethnicityMainCategoryArr = [[NSArray alloc] initWithObjects:@"Hispanic or Latino", @"Ashkenazi Jewish", @"Not Hispanic or Latino", nil];
        
        ethnicityHispanicOrLatinoCategoryArr = [[NSArray alloc] initWithObjects:@"Central American", @"Cuban", @"Dominican", @"Mexican", @"Other Hispanic", @"Peurto Rican", @"South American", nil];
        
        ethnicityAshkenaziJewishCategoryArr = [[NSArray alloc] initWithObjects:@"Ashkenazi Jewish", nil];
        
        ethnicityNotHispanicOrLatinoCategoryArr = [[NSArray alloc] initWithObjects:@"Not Hispanic or Latino", nil];
    }
    return self;
}

@end
