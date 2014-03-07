//
//  ContractedDisease.h
//  pedigree
//
//  Created by Murali Tammineni on 3/7/14.
//  Copyright (c) 2014 CDC Informatics R&D Lab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Person;

@interface ContractedDisease : NSManagedObject

@property (nonatomic, retain) NSNumber * ageAtDiagnosis;
@property (nonatomic, retain) NSString * categoryName;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) Person *person;

@end
