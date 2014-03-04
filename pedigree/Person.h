//
//  Person.h
//  pedigree
//
//  Created by Murali Tammineni on 3/4/14.
//  Copyright (c) 2014 CDC Informatics R&D Lab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ContractedDisease;

@interface Person : NSManagedObject

@property (nonatomic, retain) NSNumber * areParentsRelatedOtherThanMarraige;
@property (nonatomic, retain) NSDate * dateOfBirth;
@property (nonatomic, retain) NSNumber * ethnicity;
@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSNumber * gender;
@property (nonatomic, retain) NSNumber * height;
@property (nonatomic, retain) NSNumber * isAdopted;
@property (nonatomic, retain) NSNumber * isIdenticalTwin;
@property (nonatomic, retain) NSNumber * isLiving;
@property (nonatomic, retain) NSNumber * isTwin;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) NSNumber * race;
@property (nonatomic, retain) NSNumber * weight;
@property (nonatomic, retain) NSData * profileImage;
@property (nonatomic, retain) NSSet *contractedDisease;
@end

@interface Person (CoreDataGeneratedAccessors)

- (void)addContractedDiseaseObject:(ContractedDisease *)value;
- (void)removeContractedDiseaseObject:(ContractedDisease *)value;
- (void)addContractedDisease:(NSSet *)values;
- (void)removeContractedDisease:(NSSet *)values;

@end
