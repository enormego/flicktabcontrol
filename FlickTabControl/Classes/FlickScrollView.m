//
//  FlickScrollView.m
//  FlickTabControl
//
//  Created by Shaun Harrison on 12/12/08.
//  Copyright 2008 enormego. All rights reserved.
//

#import "FlickScrollView.h"


@implementation FlickScrollView
@synthesize actualScrollView;

- (void)setContentOffset:(CGPoint)contentOffset animated:(BOOL)animated {
	[super setContentOffset:contentOffset animated:animated];
	[actualScrollView setContentOffset:contentOffset animated:animated];
}

- (void)scrollRectToVisible:(CGRect)rect animated:(BOOL)animated {
	[super scrollRectToVisible:rect animated:animated];
	[actualScrollView scrollRectToVisible:rect animated:animated];
}

- (BOOL)touchesShouldBegin:(NSSet *)touches withEvent:(UIEvent *)event inContentView:(UIView *)view {
	[actualScrollView touchesShouldBegin:touches withEvent:event inContentView:view];
	return [super touchesShouldBegin:touches withEvent:event inContentView:view];
}

- (BOOL)touchesShouldCancelInContentView:(UIView *)view {
	[actualScrollView touchesShouldCancelInContentView:view];
	return [super touchesShouldCancelInContentView:view];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	[super touchesBegan:touches withEvent:event];
	[actualScrollView touchesBegan:touches withEvent:event];
	moved = NO;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	[super touchesMoved:touches withEvent:event];
	[actualScrollView touchesMoved:touches withEvent:event];
	moved = YES;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	[super touchesEnded:touches withEvent:event];
	[actualScrollView touchesEnded:touches withEvent:event];
	
	if(!moved) {
		CGPoint point = [(UITouch*)[[touches allObjects] objectAtIndex:0] locationInView:self];
		for(UIView* view in actualScrollView.subviews) {
			if([view isKindOfClass:[UIControl class]]) {
				if(point.x >= view.frame.origin.x && point.x <= view.frame.origin.x + view.frame.size.width) {
					if(point.y >= view.frame.origin.y && point.y <= view.frame.origin.y + view.frame.size.height) {
						[(UIControl*)view sendActionsForControlEvents:UIControlEventTouchUpInside];
						break;
					}
				}
			}
		}
	}

	moved = NO;
}

- (void)dealloc {
	[actualScrollView release];
    [super dealloc];
}


@end
