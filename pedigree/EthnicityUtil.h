//
//  EthnicityUtil.h
//  pedigree
//
//  Created by Murali Tammineni on 2/7/14.
//  Copyright (c) 2014 CDC Informatics R&D Lab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EthnicityUtil : NSObject

typedef NS_ENUM(int32_t, Ethnicity){
    kHispanicOrLatino,
    kAshkenaziJewish,
    kNotHispanicOrLatino
};

@property (nonatomic, strong) NSArray *ethnicityMainCategoryArr;
@property (nonatomic, strong) NSArray *ethnicityHispanicOrLatinoCategoryArr;
@property (nonatomic, strong) NSArray *ethnicityAshkenaziJewishCategoryArr;
@property (nonatomic, strong) NSArray *ethnicityNotHispanicOrLatinoCategoryArr;


@end
