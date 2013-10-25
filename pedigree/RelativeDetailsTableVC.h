//
//  RelativeDetailsTableVC.h
//  pedigree
//
//  Created by jtq6 on 10/21/13.
//  Copyright (c) 2013 CDC Informatics R&D Lab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RelativeDetailsTableVC : UITableViewController

@property (weak, nonatomic) IBOutlet UILabel *lblRelationship;
@property (weak, nonatomic) IBOutlet UILabel *lblBirthdate;
@property (weak, nonatomic) IBOutlet UILabel *lblLiving;
@property (weak, nonatomic) IBOutlet UILabel *lblTwin;
@property (weak, nonatomic) IBOutlet UILabel *lblAdopted;
@end
