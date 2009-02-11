//
//  FlickScrollView.h
//  FlickTabControl
//
//  Created by Shaun Harrison on 12/12/08.
//  Copyright 2008 enormego. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface FlickScrollView : UIScrollView {
@private
	UIScrollView* actualScrollView;
	BOOL moved;
}

@property(nonatomic,retain) IBOutlet UIScrollView* actualScrollView;
@end
