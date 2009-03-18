//
//  FlickTabView.h
//  FlickTabControl
//
//  Created by Shaun Harrison on 12/12/08.
//  Copyright 2008 enormego. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FlickTabView;

/*
 * Creating instances of this class by yourself is relatively useless.
 * If it's absolutely neccessary see the loadView method in FlickTableViewController
 */

@protocol FlickTabViewDelegate, FlickTabViewDataSource;

@interface FlickTabView : UIView<UIScrollViewDelegate> {
@private
	UIScrollView* scrollView;
	UIView* leftCap;
	UIView* rightCap;
	id dataSource;
	id delegate;
	UIEdgeInsets buttonInsets;
}

/*
 * Reloads the tabs
 */
- (void)reloadData;

/* 
 * Scrolls to and selects the tab at the given index, no scrolling animation
 */
- (void)selectTabAtIndex:(NSInteger)index;

/*
 * Scrolls to and selects the tab at the given index, scrolling animation optional
 */
- (void)selectTabAtIndex:(NSInteger)index animated:(BOOL)animated;

/*
 * @see FlickTabViewDelegate protocol
 */
@property(nonatomic,assign) IBOutlet id<FlickTabViewDelegate> delegate;

/*
 * @see FlickTabViewDataSource protocol
 */
@property(nonatomic,assign) IBOutlet id<FlickTabViewDataSource> dataSource;

/*
 * Currectly selected tab
 */
@property(readonly) NSInteger selectedTabIndex;

/*
 * Allows you to set the button left/right insets, top/bottom values will be set to 0 regardless.
 */
@property(nonatomic,assign) UIEdgeInsets buttonInsets;

/*
 * These properties are used internally, shouldn't need to be used elsewhere.
 */
@property(nonatomic,retain) IBOutlet UIScrollView* scrollView;
@property(nonatomic,retain) IBOutlet UIView* leftCap;
@property(nonatomic,retain) IBOutlet UIView* rightCap;

@end

@protocol FlickTabViewDelegate<NSObject>
- (void)scrollTabView:(FlickTabView*)scrollTabView didSelectedTabAtIndex:(NSInteger)index;
@end

@protocol FlickTabViewDataSource<NSObject>
- (NSInteger)numberOfTabsInScrollTabView:(FlickTabView*)scrollTabView;
- (NSString*)scrollTabView:(FlickTabView*)scrollTabView titleForTabAtIndex:(NSInteger)index;
@end
