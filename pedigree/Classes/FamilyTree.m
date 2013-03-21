//
//  FamilyTree.m
//  pedigree
//
//  Created by jtq6 on 3/21/13.
//  Copyright (c) 2013 CDC Informatics R&D Lab. All rights reserved.
//

#import "FamilyTree.h"
#import "AppManager.h"

@implementation FamilyTree

AppManager *appMgr;

-(id)init
{
    // load application manager
    appMgr = [AppManager singletonAppManager];
    
    self = [super init];
    
    if (self) {
        self.famTree = [[NSMutableArray alloc] init];
    }

    
    return self;
}

-(void)addRelative:(NSString *)newRelationship lastName:(NSString *)newLastName firstName:(NSString *)newFirstName
{

    FamilyMember *newPerson = [[FamilyMember alloc] initWithRelationshipNames:newRelationship lastName:newLastName firstName:newFirstName];
    [self.famTree addObject:newPerson];

    
}

-(NSInteger)numberOfRelatives
{
    return [self.famTree count];
}

-(FamilyMember *)relativeFromIndex:(NSInteger) index
{
    FamilyMember *relativeAtIndex = [self.famTree objectAtIndex:index];
    return relativeAtIndex;
}

-(void)loadTestData
{
    
    NSString *myLastName = @"Smithereen";
    
    [self addRelative:@"Dad" lastName:myLastName firstName:@"John"];
    [self addRelative:@"Mother" lastName:myLastName firstName:@"Mary"];
    [self addRelative:@"Brother" lastName:myLastName firstName:@"Jim"];
    [self addRelative:@"Brother" lastName:myLastName firstName:@"William"];
    [self addRelative:@"Sister" lastName:myLastName firstName:@"Julie"];
    [self addRelative:@"Sister" lastName:myLastName firstName:@"Wendy"];
    
    [self addRelative:@"Grandfather" lastName:myLastName firstName:@"Mitchell"];
    [self addRelative:@"Grandmother" lastName:myLastName firstName:@"Lillian"];
    
    [self addRelative:@"Grandfather" lastName:@"Watson" firstName:@"Thomas"];
    [self addRelative:@"Grandmother" lastName:@"Watson" firstName:@"Sandra"];
    
}

@end
