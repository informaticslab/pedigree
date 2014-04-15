//
//  MainTabBarVC.m
//  pedigree
//
//  Created by jtq6 on 9/25/13.
//  Copyright (c) 2013 CDC Informatics R&D Lab. All rights reserved.
//

#import "MainTabBarVC.h"
#import "Relative.h"
#import "Person.h"
#import "ContractedDisease.h"
#import "IntroVC.h"

@interface MainTabBarVC ()

@property (nonatomic, retain) IntroVC *introVC;

@end

@implementation MainTabBarVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewDidAppear:(BOOL)animated{
   
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
  //  [self loadTestData];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)showIntroView
{
    [self performSegueWithIdentifier:@"showIntroSegue" sender:self];
}

@end
