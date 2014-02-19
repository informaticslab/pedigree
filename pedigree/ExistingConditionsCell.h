//
//  ExistingConditionsCell.h
//  pedigree
//
//  Created by Madhavi Tammineni on 2/19/14.
//  Copyright (c) 2014 CDC Informatics R&D Lab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExistingConditionsCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *lbldisease;
@property (nonatomic, weak) IBOutlet UILabel *lbldiseaseCategory;
@property (nonatomic, weak) IBOutlet UILabel *lblAge;

@end
