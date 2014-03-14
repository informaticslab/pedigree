//
//  GridViewController.m
//  pedigree
//
//  Created by Murali Tammineni on 3/11/14.
//  Copyright (c) 2014 CDC Informatics R&D Lab. All rights reserved.
//

#import "GridViewController.h"
#import "GridView.h"

#define kGraphHeight 300
#define kDefaultGraphWidth 900

@interface GridViewController ()
@property (nonatomic, weak) IBOutlet GridView *gridView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@end

@implementation GridViewController

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
    
    _scrollView.contentSize = CGSizeMake(kDefaultGraphWidth, kGraphHeight);

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

@end
