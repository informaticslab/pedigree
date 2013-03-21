//
//  FamilyMember.m
//  pedigree
//
//  Created by jtq6 on 3/21/13.
//  Copyright (c) 2013 CDC Informatics R&D Lab. All rights reserved.
//

#import "FamilyMember.h"

@implementation FamilyMember

-(id)initWithRelationshipNames:(NSString *)newRelationship lastName:(NSString *)newLastName firstName:(NSString *)newFirstName
{
    if ((self = [super init])) {
        self.lastName = newLastName;
        self.firstName = newFirstName;
        self.relationship = newRelationship;
    }
    return self;
    
}

@end
