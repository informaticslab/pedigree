//
//  Disease.h
//  pedigree
//
//  Created by Murali Tammineni on 2/10/14.
//  Copyright (c) 2014 CDC Informatics R&D Lab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Disease : NSObject

@property (nonatomic, retain) NSString * categoryName;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * ageAtDiagnosis;

@end
