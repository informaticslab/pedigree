//
//  FamilyMembersVC.h
//  pedigree
//
//  Created by jtq6 on 3/21/13.
//  Copyright (c) 2013 CDC Informatics R&D Lab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Relative.h"

@interface RelativesTableVC : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    UITableView *tblView;
}

@property (nonatomic, strong) NSArray *relatives;
@property (nonatomic, strong) IBOutlet UITableView *tblView;
-(void)loadRelatives;
@end
