//
//  ParentsRelationCell.m
//  pedigree
//
//  Created by Murali Tammineni on 1/31/14.
//  Copyright (c) 2014 CDC Informatics R&D Lab. All rights reserved.
//

#import "ParentsRelationCell.h"

@implementation ParentsRelationCell

@synthesize parentsRelationSwitch;

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
