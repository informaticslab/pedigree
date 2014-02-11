//
//  TestVCViewController.m
//  pedigree
//
//  Created by Murali Tammineni on 2/9/14.
//  Copyright (c) 2014 CDC Informatics R&D Lab. All rights reserved.
//

#import "TestVC.h"

@interface TestVC ()

@property (nonatomic, strong) UITextField *txtTest;

@end

@implementation TestVC

@synthesize txtTest;

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

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    NSLog(@"text filed should begin editing");
    return YES;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    NSLog(@"text filed did begin editing");
}


-(BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    NSLog(@"text filed should end editing");
    return YES;
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    NSLog(@"text filed did end editing");
}

-(BOOL)textFieldShouldClear:(UITextField *)textField{
    NSLog(@"Text field should clear");
    return YES;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    NSLog(@"Text field should return");
    [textField resignFirstResponder];
    return YES;
}

@end
