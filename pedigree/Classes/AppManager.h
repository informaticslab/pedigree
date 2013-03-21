//
//  AppManager.h
//  pedigree
//
//  Created by jtq6 on 3/21/13.
//  Copyright (c) 2013 CDC Informatics R&D Lab. All rights reserved.
//

#import <Foundation/Foundation.h>

//#define DEBUG
#import "Debug.h"
#import "FamilyTree.h"

@interface AppManager : NSObject 

@property (nonatomic, retain) NSString *appName;
@property (nonatomic, retain) UIFont *tableFont;
@property (nonatomic, retain) FamilyTree *famTree;
@property BOOL agreedWithEula;

+ (id)singletonAppManager;
-(BOOL)isDebugInfoEnabled;

@end
