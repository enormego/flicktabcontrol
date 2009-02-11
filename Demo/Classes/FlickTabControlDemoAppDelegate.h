//
//  FlickTabControlDemoAppDelegate.h
//  FlickTabControlDemo
//
//  Created by Shaun Harrison on 2/11/09.
//  Copyright enormego 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FlickTabControlDemoAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end

