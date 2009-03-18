//
//  FlickTableViewController.h
//  FlickTabControl
//
//  Created by Shaun Harrison on 2/10/09.
//  Copyright 2009 enormego. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlickTabView.h"

/*
 * Subclasses of FlickTableViewController should implement both the UITableView and FlickTabView delegate and datasource protocols.
 * Important: Do not set tableHeaderView, tableHeaderView is set to flickTabView
 */

@interface FlickTableViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,FlickTabViewDataSource,FlickTabViewDelegate> {
@private
	UITableView* _tableView;
	FlickTabView* _flickTabView;
}

/*
 * Provides access to the tableView, just like UITableViewController
 */
@property(nonatomic,retain) UITableView* tableView;

/*
 * Provides access to the current flickTabView instance
 */
@property(nonatomic,retain) FlickTabView* flickTabView;
@end
