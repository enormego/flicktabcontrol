//
//  FlickTabButton.m
//  Enormego Frameworks
//
//  Created by Shaun Harrison on 12/12/08.
//  Copyright 2008 enormego. All rights reserved.
//

#import "FlickTabButton.h"

#define unselectedColor [UIColor colorWithRed:78/255.0f green:86/255.0f blue:92/255.0f alpha:1.0f]
#define unselectedShadowColor [UIColor colorWithWhite:1.0f alpha:0.7f]
#define selectedColor [UIColor whiteColor]

@implementation FlickTabButton

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
		imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, -1.0f, frame.size.width, frame.size.height)];
		imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
		imageView.backgroundColor = [UIColor clearColor];
		imageView.image = [[UIImage imageNamed:@"flick-tab-over.png"] stretchableImageWithLeftCapWidth:11.0f topCapHeight:0.0f];
		imageView.hidden = YES;
		imageView.contentMode = UIViewContentModeScaleAspectFit;
		
		label = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, -1.0f, frame.size.width, frame.size.height)];
		label.textAlignment = UITextAlignmentCenter;
		label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
		label.backgroundColor = [UIColor clearColor];
		label.font = [UIFont boldSystemFontOfSize:13.0f];
		label.textColor = unselectedColor;
		label.shadowColor = unselectedShadowColor;
		label.shadowOffset = CGSizeMake(0.0f,-1.0f);
		
		[self addSubview:imageView];
		[self addSubview:label];
		
		self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
    // Drawing code
}


- (void)setText:(NSString*)text {
	label.text = text;
}

- (void)markSelected {
	label.textColor = selectedColor;
	label.shadowColor = unselectedColor;
	imageView.hidden = NO;
	self.selected = YES;
}

- (void)markUnselected {
	label.textColor = unselectedColor;
	label.shadowColor = unselectedShadowColor;
	imageView.hidden = YES;
	self.selected = NO;
}

- (NSString*)text {
	return label.text;
}

- (UIFont*)font {
	return label.font;
}

- (void)dealloc {
	[label release];
    [super dealloc];
}


@end
