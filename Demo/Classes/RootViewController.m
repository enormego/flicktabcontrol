//
//  RootViewController.m
//  FlickTabControlDemo
//
//  Created by Shaun Harrison on 2/11/09.
//  Copyright enormego 2009. All rights reserved.
//

#import "RootViewController.h"
#import "FlickTabControlDemoAppDelegate.h"


@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];

	UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 50.0f)];
	label.text = @"developers.enormego.com";
	label.textAlignment = UITextAlignmentCenter;
	label.font = [UIFont boldSystemFontOfSize:12.0f];
	label.autoresizingMask = UIViewAutoresizingFlexibleWidth;
	self.tableView.tableFooterView = label;
	[label release];
	
	self.title = @"FlickTabControl Demo";
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}

#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 25;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Set up the cell...
	cell.text = [NSString stringWithFormat:@"Row %d in Tab %d", indexPath.row + 1, self.flickTabView.selectedTabIndex + 1];

    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}


#pragma mark -
#pragma mark FlickTabView Delegate & Data Source

- (void)scrollTabView:(FlickTabView*)scrollTabView didSelectedTabAtIndex:(NSInteger)index {
	[self.tableView reloadData];
}

- (NSInteger)numberOfTabsInScrollTabView:(FlickTabView*)scrollTabView {
	return 8;
}

- (NSString*)scrollTabView:(FlickTabView*)scrollTabView titleForTabAtIndex:(NSInteger)index {
	return [NSString stringWithFormat:@"Tab %d", index+1];
}


#pragma mark -


- (void)dealloc {
    [super dealloc];
}


@end

