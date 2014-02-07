//
//  RaceEthnicityUtil.m
//  pedigree
//
//  Created by Madhavi Tammineni on 2/5/14.
//  Copyright (c) 2014 CDC Informatics R&D Lab. All rights reserved.
//

#import "RaceUtil.h"

@implementation RaceUtil

@synthesize raceMainCategoryArr;
@synthesize raceAmericanIndianOrAlaskanNativeArr;
@synthesize raceAsianArr;
@synthesize raceBlackAfricanOrAmericanArr;
@synthesize raceNativeHawaiianArr;
@synthesize raceWhiteArr;

- (id)init {
    if (self = [super init]) {
       
        //initializing the object
        
        raceMainCategoryArr = [[NSArray alloc] initWithObjects:@"American Indian or Alaskan Native", @"Asian", @"Black or African-American",  @"Native Hawaiian or Other Pacific Islander ",@"White", nil];
        
        raceAmericanIndianOrAlaskanNativeArr = [[NSArray alloc] initWithObjects:@"American Indian or Alaskan Native", nil];
        raceAsianArr =  [[NSArray alloc] initWithObjects:@"Asian Indian", @"Chinese", @"Filipino",  @"Japanese", @"Korean", @"Vietnamese", @"Other Asian", @"Unknown", nil];
        raceBlackAfricanOrAmericanArr = [[NSArray alloc] initWithObjects:@"Black or African-American", nil];
        raceNativeHawaiianArr = [[NSArray alloc] initWithObjects:@"Chamorro", @"Guamanian", @"Native Hawaiian",  @"Samoan",@"Unknown", nil];
        raceWhiteArr = [[NSArray alloc] initWithObjects:@"White", nil];
        
    }
    return self;
}

@end
