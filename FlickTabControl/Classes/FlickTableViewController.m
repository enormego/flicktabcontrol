//
//  FlickTableViewController.m
//  FlickTabControl
//
//  Created by Shaun Harrison on 2/10/09.
//  Copyright 2009 enormego. All rights reserved.
//

#import "FlickTableViewController.h"

@implementation FlickTableViewController
@synthesize tableView=_tableView, flickTabView=_flickTabView;

- (void)loadView {
	[super loadView];
	self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	
	UITableView* tableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
	self.tableView = tableView;
	[tableView release];
	
	self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	self.tableView.delegate = self;
	self.tableView.dataSource = self;
	
	[self.view addSubview:self.tableView];
	
	FlickTabView* aFlickTabView = [[FlickTabView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.view.frame.size.width, 43.0f)];
	self.flickTabView = aFlickTabView;
	[aFlickTabView release];
	
	self.flickTabView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleBottomMargin;
	self.flickTabView.delegate = self;
	self.flickTabView.dataSource = self;
	
	self.flickTabView.scrollView = [[[UIScrollView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.flickTabView.frame.size.width, self.flickTabView.frame.size.height)] autorelease];
	self.flickTabView.scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
	self.flickTabView.scrollView.directionalLockEnabled = YES;
	self.flickTabView.scrollView.alwaysBounceVertical = NO;
	self.flickTabView.scrollView.alwaysBounceHorizontal = YES;
	self.flickTabView.scrollView.showsVerticalScrollIndicator = NO;
	self.flickTabView.scrollView.showsHorizontalScrollIndicator = NO;
	self.flickTabView.scrollView.bounces = YES;
	self.flickTabView.scrollView.contentInset = UIEdgeInsetsMake(0.0f, 20.0f, 0.0f, 20.0f);
	self.flickTabView.scrollView.delegate = self.flickTabView;
	
	self.flickTabView.backgroundColor = [UIColor colorWithHue:0.573816156f saturation:0.03f brightness:0.91f alpha:1.0f];
	
	UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.flickTabView.frame.size.width, self.flickTabView.frame.size.height)];
	imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
	imageView.image = [UIImage imageNamed:@"flick-tab-bck.png"];
	
	[self.flickTabView addSubview:imageView];
	[imageView release];
	
	[self.flickTabView addSubview:self.flickTabView.scrollView];
	
	UIImageView* leftCap = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 39.0f, 43.0f)];
	leftCap.image = [UIImage imageNamed:@"flick-fade-lt.png"];
	leftCap.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin;
	self.flickTabView.leftCap = leftCap;
	[leftCap release];
	
	UIImageView* rightCap = [[UIImageView alloc] initWithFrame:CGRectMake(self.flickTabView.frame.size.width-39.0f, 0.0f, 39.0f, 43.0f)];
	rightCap.image = [UIImage imageNamed:@"flick-fade-rt.png"];
	rightCap.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin;
	self.flickTabView.rightCap = rightCap;
	[rightCap release];
	
	[self.flickTabView addSubview:self.flickTabView.leftCap];
	[self.flickTabView addSubview:self.flickTabView.rightCap];
	
	[self.flickTabView awakeFromNib];
	
	self.tableView.tableHeaderView = [[[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 1.0f, 43.0f)] autorelease];
	
	[self.view addSubview:self.flickTabView];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
	if(scrollView == self.tableView) {
		float y = (-scrollView.contentOffset.y);
		float height = y > 0.0f ? 43.0f + y : 43.0f;
		y = y > 0.0f ? 0.0f : y;
		self.flickTabView.frame = CGRectMake(0.0f, y, self.tableView.frame.size.width, height);
		
		float inset = 0.0f;
		if(scrollView.contentOffset.y < 44.0f) {
			inset = 44.0f + -scrollView.contentOffset.y;
		}
		
		self.tableView.scrollIndicatorInsets = UIEdgeInsetsMake(inset, 0.0f, 0.0f, 0.0f);
	}
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
    return 0;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Set up the cell...
	
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)scrollTabView:(FlickTabView*)scrollTabView didSelectedTabAtIndex:(NSInteger)index {
	// Subclass
}

- (NSInteger)numberOfTabsInScrollTabView:(FlickTabView*)scrollTabView {
	return 0;
}

- (NSString*)scrollTabView:(FlickTabView*)scrollTabView titleForTabAtIndex:(NSInteger)index {
	return nil;
}


- (void)dealloc {
	self.flickTabView = nil;
	self.tableView = nil;
    [super dealloc];
}


@end

