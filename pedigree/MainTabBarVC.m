//
//  MainTabBarVC.m
//  pedigree
//
//  Created by jtq6 on 9/25/13.
//  Copyright (c) 2013 CDC Informatics R&D Lab. All rights reserved.
//

#import "MainTabBarVC.h"
#import "Relative.h"

@interface MainTabBarVC ()

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

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self loadTestData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadTestData
{
    Relative *newRelative = [NSEntityDescription insertNewObjectForEntityForName:@"Relative" inManagedObjectContext:APP_MGR.managedObjectContext ];
    newRelative.lastName = @"Smithereen";
    newRelative.firstName = @"John";
    
    NSError *error = nil;
    [APP_MGR.managedObjectContext save:&error];
    
    if (error)
    {
        DebugLog(@"Problem loading test data: %@", error);
    }
    
    
}



@end
