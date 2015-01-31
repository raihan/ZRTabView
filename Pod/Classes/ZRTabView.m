//
//  ZRTabView.m
//  ZRTabView
//
//  Created by Abdullah Md. Zubair on 1/31/15.
//  Copyright (c) 2015 Abdullah Md. Zubair. All rights reserved.
//

#import "ZRTabView.h"

@implementation ZRTabView

#define initialTag 30000
#define buttonPadding 55
#define buttonStringPadding 60
#define statingPadding 5
#define viewControllerHeight 420
#define verticalY 3
#define tabButtonHeight 24
#define scrollerHeight 30

@synthesize viewsNameList, viewsList, delegate;

- (id)initWithPoint:(CGPoint)point withViews:(NSMutableArray *)viewsArray viewsNameArray:(NSMutableArray *)viewsNameArray initialSelection:(int)index
{
    self = [super initWithFrame:CGRectMake(point.x, point.y, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height - 45.0)];
    if (self)
    {
        // Initialization code
        self.viewsList = viewsArray;
        self.viewsNameList = viewsNameArray;
        UIScrollView *tabScroller = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, scrollerHeight)];
        [tabScroller setBackgroundColor:[UIColor colorWithRed:43/255.0 green:46/255.0 blue:48/255.0 alpha:1.0]];
        tabScroller.showsHorizontalScrollIndicator = NO;
        tabScroller.showsVerticalScrollIndicator = NO;
        int x=0;
        [self.delegate didSelectTabBarWidgetIndex:0];
        for (int i=0; i<[self.viewsNameList count]; i++)
        {
            CGSize buttonStringSize = [[self.viewsNameList objectAtIndex:i] sizeWithFont:[UIFont fontWithName:@"Arial" size:12.0f]];
            UIButton *aButton = [[UIButton alloc] initWithFrame:CGRectMake(x+statingPadding, verticalY, buttonStringSize.width+buttonPadding, tabButtonHeight)];
            [aButton setTitle:[viewsNameArray objectAtIndex:i] forState:UIControlStateNormal];
            [aButton setBackgroundImage:[UIImage imageNamed:@"btn_bg_gray_large.png"] forState:UIControlStateNormal];
            aButton.tag = initialTag+i;
            [aButton.titleLabel setFont:[UIFont fontWithName:@"Arial" size:12.0f]];
            [aButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
            [aButton addTarget:self action:@selector(changeTab:) forControlEvents:UIControlEventTouchUpInside];
            NSLog(@"x= %d",x);
            [tabScroller addSubview:aButton];
            x=x+buttonStringPadding+buttonStringSize.width;
        }
        [self addSubview:tabScroller];
        [tabScroller setContentSize:CGSizeMake(x+statingPadding, scrollerHeight)];
        prevSelectedTabBarItemIndex = 1;
        
        if ((index >= 0) && (index < [self.viewsList count]))
        {
            [self changeTab:[self viewWithTag:initialTag+index]];
        }
    }
    return self;
}

-(void)changeTab:(id)sender
{
    UIButton *selectedButton = (UIButton *)sender;
    if ((selectedButton.tag-initialTag) != prevSelectedTabBarItemIndex)
    {
        [self clearButtonSelection];
        [selectedButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        CATransition *animation = [CATransition animation];
        animation.type = kCATransitionFade;
        animation.duration = 0.15;
        [selectedButton.layer addAnimation:animation forKey:nil];
        [selectedButton setBackgroundImage:[UIImage imageNamed:@"btn_bg_black_large.png"] forState:UIControlStateNormal];
        UIView *selectedView = ((UIViewController *)[self.viewsList objectAtIndex:(selectedButton.tag-initialTag)]).view;
        [selectedView setFrame:CGRectMake(0, scrollerHeight, [[UIScreen mainScreen] bounds].size.width, selectedView.frame.size.height)];
        [self addSubview:selectedView];
        [self.delegate didSelectTabBarWidgetIndex:(int)selectedButton.tag - initialTag];
        prevSelectedTabBarItemIndex = (int)selectedButton.tag - initialTag;
    }
}

-(void)clearButtonSelection
{
    for (int i=0; i<[viewsNameList count]; i++)
    {
        [((UIViewController *)[self.viewsList objectAtIndex:i]).view removeFromSuperview];
        UIButton *selectedButton = (UIButton *)[self viewWithTag:initialTag+i];
        [selectedButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [selectedButton setBackgroundImage:[UIImage imageNamed:@"btn_bg_gray_large.png"] forState:UIControlStateNormal];
    }
}

-(void)selectTabWithIndex:(int)index
{
    UIButton *selecButton = (UIButton *)[self viewWithTag:initialTag+index];
    [self changeTab:selecButton];
}

@end
