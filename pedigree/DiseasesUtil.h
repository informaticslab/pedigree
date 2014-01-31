//
//  DiseasesUtil.h
//  pedigree
//
//  Created by Murali Tammineni on 1/29/14.
//  Copyright (c) 2014 CDC Informatics R&D Lab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DiseasesUtil : NSObject

/*typedef enum Diseases : int32_t {
    kNoKnownConditions = 0,
    kCancer = 1,
    kClottingDisorder = 2,
    kDementiaAlzheimers = 3,
    kDiabetes = 4,
    kGastro = 5,
    kHeart = 6,
    kHighCholesterol = 7,
    kHyperTension = 8,
    kKidney = 9,
    kLung = 10,
    kOsteoporosis = 11,
    kPsychologicalDisorder = 12,
    kSepticemia = 13,
    kStrokeBrainAttack = 14,
    kSuddenInfantDeathSyndrome = 15,
    kUnknownDisease = 16,
    kOtherAddNew = 17
}Diseases;
 */

typedef NS_ENUM(int32_t, Diseases){
    kNoKnownConditions = 0,
    kCancer = 1,
    kClottingDisorder = 2,
    kDementiaAlzheimers = 3,
    kDiabetes = 4,
    kGastro = 5,
    kHeart = 6,
    kHighCholesterol = 7,
    kHyperTension = 8,
    kKidney = 9,
    kLung = 10,
    kOsteoporosis = 11,
    kPsychologicalDisorder = 12,
    kSepticemia = 13,
    kStrokeBrainAttack = 14,
    kSuddenInfantDeathSyndrome = 15,
    kUnknownDisease = 16,
    kOtherAddNew = 17
};

typedef NS_ENUM(int32_t, AgeAtDiagnosis){
    kPreBirth = 0,
    kNewBorn = 1,
    kInInfancy = 2,
    kInChildhood = 3,
    kInAdolescence = 4,
    kTwentyToTwentyNine = 5,
    kThirtyToThirtyNine = 6,
    kFortyToFortyNine = 7,
    kFiftyToFiftyNine = 8,
    kSixtyAndOlder = 9,
    kUnknownAge = 10,
  
};


@end
