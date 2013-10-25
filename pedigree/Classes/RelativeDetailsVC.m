//
//  RelativeDetailsVC.m
//  pedigree
//
//  Created by jtq6 on 9/26/13.
//  Copyright (c) 2013 CDC Informatics R&D Lab. All rights reserved.
//

#import "RelativeDetailsVC.h"
#import "RelativeDetailsTableVC.h"

RelativeDetailsTableVC *detailsTVC;

@interface RelativeDetailsVC ()

@end

@implementation RelativeDetailsVC


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    _txtFirstName.text = _relative.firstName;
    _txtLastName.text = _relative.lastName;
    detailsTVC.lblRelationship.text = _relative.relationDescription;
    //detailsTVC.lblAdopted.text = _relative.

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"embedRelativeDetailsTableView"])
    {
        detailsTVC = (RelativeDetailsTableVC *)segue.destinationViewController;
        
    }
}

@end
