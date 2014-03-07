//
//  FamilyMemberCell.h
//  pedigree
//
//  Created by Murali Tammineni on 3/7/14.
//  Copyright (c) 2014 CDC Informatics R&D Lab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FamilyMemberCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UIImageView *imgRelativePhoto;
@property (nonatomic, weak) IBOutlet UILabel *lblRelativeName;
@property (nonatomic, weak) IBOutlet UILabel *lblRelationDescription;

@end
