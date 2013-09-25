//
//  ContractedDisease.h
//  pedigree
//
//  Created by jtq6 on 9/24/13.
//  Copyright (c) 2013 CDC Informatics R&D Lab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Person;

@interface ContractedDisease : NSManagedObject

@property (nonatomic, retain) NSNumber * ageAtDiagnosis;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * categoryName;
@property (nonatomic, retain) Person *person;

@end
