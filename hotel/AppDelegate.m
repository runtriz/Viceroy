//
//  AppDelegate.m
//  hotel
//
//  Created by Marc Charbonneau on 2/10/12.
//  Copyright (c) 2012 ELC Technologies. All rights reserved.
//

#import "AppDelegate.h"
#import "HotelRootViewController_iPhone.h"
#import "HotelRootViewController_iPad.h"

@implementation AppDelegate

@synthesize window = _window;

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    
    UIViewController *viewController;
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        viewController = [[[HotelRootViewController_iPhone alloc] initWithNibName:@"HotelRootViewController_iPhone" bundle:nil] autorelease];
    }
    else 
    {
        viewController = [[[HotelRootViewController_iPad alloc] initWithNibName:@"HotelRootViewController_iPad" bundle:nil] autorelease];
    }
    
    [self.window setBackgroundColor:[UIColor whiteColor]];
    [self.window setRootViewController:viewController];
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
