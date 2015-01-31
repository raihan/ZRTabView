//
//  ZRViewController.m
//  ZRTabView
//
//  Created by raihan on 01/31/2015.
//  Copyright (c) 2014 raihan. All rights reserved.
//

#import "ZRViewController.h"
#import "ZRTestViewController.h"

@interface ZRViewController () <ZRTabViewDelegate>

@end

@implementation ZRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self initializeTabView];
}

- (void) initializeTabView
{
    // Initialize view controller
    NSString *storyBoardName = floor(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) ? @"Main_iPad" :@"Main_iPhone" ;
    ZRTestViewController *test1 = [[UIStoryboard storyboardWithName:storyBoardName bundle:nil] instantiateViewControllerWithIdentifier:@"zRTestViewController"];
    
    ZRTestViewController *test2 = [[UIStoryboard storyboardWithName:storyBoardName bundle:nil] instantiateViewControllerWithIdentifier:@"zRTestViewController"];
    [test2.view setBackgroundColor:[UIColor lightGrayColor]];
    
    ZRTestViewController *test3 = [[UIStoryboard storyboardWithName:storyBoardName bundle:nil] instantiateViewControllerWithIdentifier:@"zRTestViewController"];
    [test3.view setBackgroundColor:[UIColor orangeColor]];
    
    ZRTabView *tabView = [[ZRTabView alloc] initWithPoint:CGPointMake(0, 0) withViews:[NSMutableArray arrayWithObjects:test1, test2, test3, nil] viewsNameArray:[NSMutableArray arrayWithObjects:@"ANYTHING", @"ANYTHING MORE", @"ANY WISH YOU WANT TO WRITE", nil] initialSelection:0];
    tabView.delegate = self;
    
    [self.view addSubview:tabView];
}

-(void)didSelectTabBarWidgetIndex:(int)index
{
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
