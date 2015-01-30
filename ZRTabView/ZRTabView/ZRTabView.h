//
//  ZRTabView.h
//  ZRTabView
//
//  Created by Abdullah Md. Zubair on 1/31/15.
//  Copyright (c) 2015 Abdullah Md. Zubair. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ZRTabViewDelegate

@optional

-(void)didSelectTabBarWidgetIndex:(int)index;

@end


@interface ZRTabView : UIView
{
    int prevSelectedTabBarItemIndex;
}

@property(nonatomic,retain) NSMutableArray *viewsNameList;
@property(nonatomic,retain) NSMutableArray *viewsList;
@property(nonatomic,retain) id<ZRTabViewDelegate> delegate;

/**
 * @brief Tab bar widget custom initialization
 * @param (CGPoint) - Point
 * @param (NSMutableArray) - Views array
 * @param (NSMutableArray) - Views name array
 * @param (int) - Default index
 * @retval (id) - Initialized object
 */
- (id)initWithPoint:(CGPoint)point withViews:(NSMutableArray *)viewsArray viewsNameArray:(NSMutableArray *)viewsNameArray initialSelection:(int)index;

/**
 * @brief Select tab with index
 * @param (int) - Index
 * @retval none
 */
-(void)selectTabWithIndex:(int)index;

@end
