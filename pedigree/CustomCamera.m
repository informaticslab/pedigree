//
//  CustomCamera.m
//  pedigree
//
//  Created by Murali Tammineni on 3/3/14.
//  Copyright (c) 2014 CDC Informatics R&D Lab. All rights reserved.
//

#import "CustomCamera.h"

@interface CustomCamera ()

@end

@implementation CustomCamera

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    // override the touches ended method
    // so tapping the screen will take a picture
    [self takePicture];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

-(void) viewDidAppear: (BOOL)animated {
    [super viewDidAppear:animated];
}

@end
