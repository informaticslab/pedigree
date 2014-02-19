//
//  ExistingConditionsCell.m
//  pedigree
//
//  Created by Madhavi Tammineni on 2/19/14.
//  Copyright (c) 2014 CDC Informatics R&D Lab. All rights reserved.
//

#import "ExistingConditionsCell.h"

@implementation ExistingConditionsCell

@synthesize lbldisease;
@synthesize lbldiseaseCategory;
@synthesize lblAge;

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
