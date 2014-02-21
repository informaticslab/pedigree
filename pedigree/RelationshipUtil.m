//
//  RelationshipUtil.m
//  pedigree
//
//  Created by Murali Tammineni on 2/20/14.
//  Copyright (c) 2014 CDC Informatics R&D Lab. All rights reserved.
//

#import "RelationshipUtil.h"

@implementation RelationshipUtil

@synthesize relationshipsArr;

- (id)init {
    if (self = [super init]) {
        
        //initializing the object
        relationshipsArr = @[@"Father", @"Mother", @"Brother", @"Sister", @"Son", @"Daughter",
                          @"Paternal Grandfather", @"Paternal Grandmother", @"Paternal Uncle", @"Paternal Aunt",
                          @"Maternal Grandfather", @"Maternal Grandmother", @"Maternal Uncle", @"Maternal Aunt",
                          @"Nephew", @"Niece", @"Grandson", @"Granddaughter", @"Cousin", @"Half-Brother", @"Half-Sister"];
    }
    return self;
}

-(NSString *)relationshipNameForRelationshipId:(NSInteger )selectedRelationId
{
    NSString *relationshipName = [relationshipsArr objectAtIndex:selectedRelationId];
    return relationshipName;
}

-(NSString *)genderForRelation:(NSInteger )selectedRelationId
{
    NSInteger gender = -1;
    NSString *genderName = @"";
    
    switch (selectedRelationId) {
        case kFather:
            gender = kMale;
            break;
        case kMother:
            gender = kFeMale;
            break;
        case kBrother:
            gender = kMale;
            break;
        case kSister:
            gender = kFeMale;
            break;
        case kSon:
            gender = kMale;
            break;
        case kDaughter:
            gender = kFeMale;
            break;
        case kPaternalGrandfather:
            gender = kMale;
            break;
        case kPaternalGrandmother:
            gender = kFeMale;
            break;
        case kPaternalUncle:
            gender = kMale;
            break;
        case kPaternalAunt:
            gender = kFeMale;
            break;
        case kMaternalGrandfather:
            gender = kMale;
            break;
        case kMaternalGrandmother:
            gender = kFeMale;
            break;
        case kMaternalUncle:
            gender = kMale;
            break;
        case kMaternalAunt:
            gender = kFeMale;
            break;
        case kNephew:
            gender = kMale;
            break;
        case kNiece:
            gender = kFeMale;
            break;
        case kGrandson:
            gender = kMale;
            break;
        case kGranddaughter:
            gender = kFeMale;
            break;
        case kCousin:
            gender = kGenderUnknown;
            break;
        case kHalfBrother:
            gender = kMale;
            break;
        case kHalfSister:
            gender = kFeMale;
            break;
            
        default:
            break;
    }
    
    switch (gender) {
        case kGenderUnknown:
            genderName = @"";
            break;
        case kFeMale:
            genderName = @"Female";
            break;
        case kMale:
            genderName = @"Male";
            break;
        default:
            genderName = @"";
            break;
    }
    
    return genderName;
}

@end
