//
//  AppManager.m
//  pedigree
//
//  Created by jtq6 on 3/21/13.
//  Copyright (c) 2013 CDC Informatics R&D Lab. All rights reserved.
//

#import "AppManager.h"

static AppManager *sharedAppManager = nil;

@implementation AppManager


#pragma mark Singleton Methods
+ (id)singletonAppManager {
	@synchronized(self) {
		if(sharedAppManager == nil)
			[[self alloc] init];
	}
	return sharedAppManager;
}

+ (id)allocWithZone:(NSZone *)zone {
	@synchronized(self) {
		if(sharedAppManager == nil)  {
			sharedAppManager = [super allocWithZone:zone];
			return sharedAppManager;
		}
	}
	return nil;
}

- (id)copyWithZone:(NSZone *)zone {
	return self;
}


- (id)init {
	if ((self = [super init])) {
		self.appName = @"Pedigree";
        self.agreedWithEula = FALSE;
        self.tableFont = [UIFont boldSystemFontOfSize: 16];
        self.famTree = [[FamilyTree alloc] init];
        [self.famTree loadTestData];
	}
	return self;
}



-(BOOL)isDebugInfoEnabled
{
    // Get user preference
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    BOOL enabled = [defaults boolForKey:@"enableDebugInfo"];
    return enabled;
    
}
@end
