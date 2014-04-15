//
//  GridViewController.m
//  pedigree
//
//  Created by Murali Tammineni on 3/11/14.
//  Copyright (c) 2014 CDC Informatics R&D Lab. All rights reserved.
//

#import "GridViewController.h"
#import "GridView.h"

#define kGraphHeight 1100
#define kDefaultGraphWidth 7520

@interface GridViewController ()
@property (nonatomic, strong) IBOutlet GridView *gridView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@end

@implementation GridViewController

@synthesize relatives;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
    
    
    DebugLog(@"GridViewController :: ViewWillAppear method.");
    // load application manager
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"Relative" inManagedObjectContext:APP_MGR.managedObjectContext];
    [fetchRequest setEntity:entity];
    self.gridView.relatives = [[APP_MGR getAllPeople] copy];
    [self.gridView setNeedsDisplay];
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
