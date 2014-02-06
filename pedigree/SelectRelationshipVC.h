//
//  SelectRelationshipTVC.h
//  pedigree
//
//  Created by jtq6 on 10/29/13.
//  Copyright (c) 2013 CDC Informatics R&D Lab. All rights reserved.
//

@protocol SelectRelationshipVCDelegate;

#import <UIKit/UIKit.h>
#import "Relative.h"
#import "SelectRelationshipVC.h"

@interface SelectRelationshipVC : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) Relative *relative;
@property (weak, nonatomic) IBOutlet UITableView *tv;

-(IBAction)closeSelectRelationShipVC:(id)sender;
@property (nonatomic, strong) NSString *relDescription;

@end
