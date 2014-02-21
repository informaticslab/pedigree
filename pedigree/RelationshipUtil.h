//
//  RelationshipUtil.h
//  pedigree
//
//  Created by Murali Tammineni on 2/20/14.
//  Copyright (c) 2014 CDC Informatics R&D Lab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RelationshipUtil : NSObject

typedef NS_ENUM(int32_t, Gender){
    
    kGenderUnknown = -1,
    kFeMale = 0,
    kMale = 1,
};

typedef NS_ENUM(int32_t, Relationship){
    
    kFather = 0,
    kMother = 1,
    kBrother = 2,
    kSister = 3,
    kSon = 4,
    kDaughter = 5,
    kPaternalGrandfather = 6,
    kPaternalGrandmother = 7,
    kPaternalUncle = 8,
    kPaternalAunt = 9,
    kMaternalGrandfather = 10,
    kMaternalGrandmother = 11,
    kMaternalUncle = 12,
    kMaternalAunt = 13,
    kNephew = 14,
    kNiece = 15,
    kGrandson = 16,
    kGranddaughter = 17,
    kCousin = 18,
    kHalfBrother = 19,
    kHalfSister = 20
};

@property (nonatomic, strong) NSArray *relationshipsArr;

-(NSString *)relationshipNameForRelationshipId:(NSInteger )selectedRelationId;
-(NSString *)genderForRelation:(NSInteger )selectedRelationId;

@end
