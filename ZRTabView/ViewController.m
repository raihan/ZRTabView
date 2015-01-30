//
//  ViewController.m
//  ZRTabView
//
//  Created by Abdullah Md. Zubair on 1/31/15.
//  Copyright (c) 2015 Abdullah Md. Zubair. All rights reserved.
//

#import "ViewController.h"
#import "ZRTabView/ZRTabView.h"
#import "TestViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    TestViewController *test1 = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"testViewController"];
    
    TestViewController *test2 = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"testViewController"];
    [test2.view setBackgroundColor:[UIColor lightGrayColor]];
    
    TestViewController *test3 = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"testViewController"];
    [test3.view setBackgroundColor:[UIColor orangeColor]];
    
    ZRTabView *tabView = [[ZRTabView alloc] initWithPoint:CGPointMake(0, 0) withViews:[NSMutableArray arrayWithObjects:test1, test2, test3, nil] viewsNameArray:[NSMutableArray arrayWithObjects:@"ANYTHING", @"ANYTHING MORE", @"ANY WISH YOU WANT TO WRITE", nil] initialSelection:0];
    [self.view addSubview:tabView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
