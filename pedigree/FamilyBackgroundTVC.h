//
//  FamilyBackgroundTVC.h
//  pedigree
//
//  Created by Madhavi Tammineni on 2/3/14.
//  Copyright (c) 2014 CDC Informatics R&D Lab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FamilyBackgroundTVC : UITableViewController<UIActionSheetDelegate>

@property(nonatomic, strong) Relative *relative;
@property (weak, nonatomic) IBOutlet UILabel *lblParentsRelationship;
@property (weak, nonatomic) IBOutlet UILabel *lblRace;
@property (weak, nonatomic) IBOutlet UILabel *lblEthnicity;

@property (assign) BOOL areParentsRelatedOtherThanMarriage;
@property (nonatomic, assign) NSInteger selectedRaces;
@property (nonatomic, assign) NSInteger selectedEthnicities;

-(void)displayRelativeData:(Relative *)currRelative;

@end
