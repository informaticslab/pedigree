//
//  RaceEthnicityUtil.h
//  pedigree
//
//  Created by Murali Tammineni on 2/5/14.
//  Copyright (c) 2014 CDC Informatics R&D Lab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RaceEthnicityUtil : NSObject

typedef NS_ENUM(int32_t, Race){
    kAmericanIndianOrAlaskanNative,
    kAsian,
    kBlackAfricanOrAmerican,
    kNativeHawaiianOrOtherPacificIslander,
    kWhite
};

typedef NS_ENUM(int32_t, RaceAsian){
    kAsianIndian,
    kChinese,
    kFilipino,
    kJapanese,
    kKorean,
    kVietnamese,
    kOtherAsian,
    kUnknown
};



typedef NS_ENUM(int32_t, Ethnicity){
    kHispanicOrLatino,
    kAshkenaziJewish,
    kNotHispanicOrLatino
};

@property (nonatomic, strong) NSArray *raceMainCategoryArr;
@property (nonatomic, strong) NSArray *raceAmericanIndianOrAlaskanNativeArr;
@property (nonatomic, strong) NSArray *raceAsianArr;
@property (nonatomic, strong) NSArray *raceBlackAfricanOrAmericanArr;
@property (nonatomic, strong) NSArray *raceNativeHawaiianArr;
@property (nonatomic, strong) NSArray *raceWhiteArr;

@property (nonatomic, strong) NSArray *ethnicityMainCategoryArr;
@property (nonatomic, strong) NSArray *ethnicityHispanicOrLatinoCategoryArr;

@end
