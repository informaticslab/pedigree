//
//  FamilyMemberCell.m
//  pedigree
//
//  Created by Murali Tammineni on 3/7/14.
//  Copyright (c) 2014 CDC Informatics R&D Lab. All rights reserved.
//

#import "FamilyMemberCell.h"

@implementation FamilyMemberCell

@synthesize imgRelativePhoto;
@synthesize lblRelativeName;
@synthesize lblRelationDescription;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
