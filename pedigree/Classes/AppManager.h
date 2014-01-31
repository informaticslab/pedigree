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

// Core Data properties
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;


+ (id)singletonAppManager;
-(BOOL)isDebugInfoEnabled;
-(NSArray*)getAllPeople;
-(Person *)getPerson;

@end
