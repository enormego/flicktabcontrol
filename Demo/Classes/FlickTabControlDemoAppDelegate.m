//
//  FlickTabControlDemoAppDelegate.m
//  FlickTabControlDemo
//
//  Created by Shaun Harrison on 2/11/09.
//  Copyright enormego 2009. All rights reserved.
//

#import "FlickTabControlDemoAppDelegate.h"
#import "RootViewController.h"


@implementation FlickTabControlDemoAppDelegate

@synthesize window;
@synthesize navigationController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {
	
	// Configure and show the window
	[window addSubview:[navigationController view]];
	[window makeKeyAndVisible];
}


- (void)applicationWillTerminate:(UIApplication *)application {
	// Save data if appropriate
}


- (void)dealloc {
	[navigationController release];
	[window release];
	[super dealloc];
}

@end
