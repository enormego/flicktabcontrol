//
//  FlickTabView.m
//  FlickTabControl
//
//  Created by Shaun Harrison on 12/12/08.
//  Copyright 2008 enormego. All rights reserved.
//

#import "FlickTabView.h"
#import "FlickTabButton.h"

@interface FlickTabView (Private)
- (void)setupCaps;
@end


@implementation FlickTabView
@synthesize scrollView, leftCap, rightCap, delegate, dataSource, buttonInsets;

- (void)awakeFromNib {
	scrollView.scrollsToTop = NO;
	[self reloadData];
	
	if(scrollView.subviews && scrollView.subviews.count > 0) {
		[(FlickTabButton*)[scrollView.subviews objectAtIndex:0] markSelected];
	}
	
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateOrientation) name:UIDeviceOrientationDidChangeNotification object:nil];
}

- (void)reloadData {
	if(scrollView.subviews && scrollView.subviews.count > 0) {
		[scrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
	}
	
	if(!self.dataSource) {
		return;
	}
	
	int items;
	
	if((items = [self.dataSource numberOfTabsInScrollTabView:self]) == 0) {
		return;
	}
	
	int x;
	
	float origin_x = 0;
	for(x=0;x<items;x++) {
		NSString* str = [self.dataSource scrollTabView:self titleForTabAtIndex:x];
		
		FlickTabButton* button = [[FlickTabButton alloc] initWithFrame:CGRectZero];
		[button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
		
		CGSize size = [str sizeWithFont:button.font];
		
		button.frame = CGRectMake(origin_x, 0.0f, size.width+20.0f, 43.0f);
		origin_x += size.width + 3.0f + 20.0f;
		button.text = str;
		
		[scrollView addSubview:button];
		
		[button release];
	}
	
	scrollView.contentSize = CGSizeMake(origin_x, 43.0f);
	
	[self setupCaps];
}

- (void)buttonClicked:(FlickTabButton*)button {
	[scrollView.subviews makeObjectsPerformSelector:@selector(markUnselected)];
	[button markSelected];
	
	if(self.delegate && [self.delegate respondsToSelector:@selector(scrollTabView:didSelectedTabAtIndex:)]) {
		[self.delegate scrollTabView:self didSelectedTabAtIndex:[scrollView.subviews indexOfObject:button]];
	}
}

- (void)selectTabAtIndex:(NSInteger)index {
	[self selectTabAtIndex:index animated:NO];
}

- (void)selectTabAtIndex:(NSInteger)index animated:(BOOL)animated {
	if(!scrollView.subviews || scrollView.subviews.count < index+1) return;
	
	[scrollView.subviews makeObjectsPerformSelector:@selector(markUnselected)];
	[(FlickTabButton*)[scrollView.subviews objectAtIndex:index] markSelected];
	
	CGRect rect = ((FlickTabButton*)[scrollView.subviews objectAtIndex:index]).frame;
	rect.size.width += 25.0f;
	
	[scrollView scrollRectToVisible:rect animated:animated];
	
	[self setupCaps];
}

- (void)updateOrientation {
	[self performSelector:@selector(setupCaps) withObject:nil afterDelay:0.3];
}

- (void)setupCaps {
	if(scrollView.contentSize.width <= scrollView.frame.size.width - scrollView.contentInset.left - scrollView.contentInset.right) {
		leftCap.hidden = YES;
		rightCap.hidden = YES;
	} else {
		if(scrollView.contentOffset.x > (-scrollView.contentInset.left)+10.0f) {
			leftCap.hidden = NO;
		} else {
			leftCap.hidden = YES;
		}
		
		if((scrollView.frame.size.width+scrollView.contentOffset.x)+10.0f >= scrollView.contentSize.width) {
			rightCap.hidden = YES;
		} else {
			rightCap.hidden = NO;
		}
	}
	
}

- (void)scrollViewDidScroll:(UIScrollView *)inScrollView {
	[self setupCaps];
}

- (NSInteger)selectedTabIndex {
	int x = 0;
	
	for(FlickTabButton* tab in scrollView.subviews) {
		if([tab isMemberOfClass:[FlickTabButton class]]) {
			if([tab isSelected]) return x;
		}
		
		x++;
	}
	
	return NSNotFound;
}

- (void)setButtonInsets:(UIEdgeInsets)insets {
	buttonInsets = UIEdgeInsetsMake(0.0f, insets.left, 0.0f, insets.right);
	self.scrollView.contentInset = buttonInsets;
}

- (void)dealloc {
	[[NSNotificationCenter defaultCenter] removeObserver:self name:UIDeviceOrientationDidChangeNotification object:nil];
	[scrollView release];
	[leftCap release];
	[rightCap release];
    [super dealloc];
}


@end
