//
//  FamilyBackgroundTVC.h
//  pedigree
//
//  Created by Murali Tammineni on 2/3/14.
//  Copyright (c) 2014 CDC Informatics R&D Lab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FamilyBackgroundTVC : UITableViewController

@property (weak, nonatomic) IBOutlet UISwitch *switchParentsRelationshipSwitch;
@property (weak, nonatomic) IBOutlet UILabel *lblRace;
@property (weak, nonatomic) IBOutlet UILabel *lblEthnicity;

@property (assign) BOOL areParentsRelatedOtherThanMarriage;


@end
