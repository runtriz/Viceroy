//
//  hotelAppDelegate_iPhone.m
//  hotel
//
//  Created by Matthew Allard on 4/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "hotelAppDelegate_iPhone.h"
#import "HotelRootViewController.h"

@implementation hotelAppDelegate_iPhone

@synthesize postcardsController = _postcardsController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    HotelRootViewController *rootViewController = [[HotelRootViewController alloc] initWithNibName:@"HotelRootViewController" bundle:nil];
    PCWorkflowController *postcardsController = [[PCWorkflowController alloc] initWithAPIKey:@""];
#warning enter your account's API key.
    
    postcardsController.delegate = self;
    
    [self.window setRootViewController:rootViewController];
    [self.window makeKeyAndVisible];

    self.postcardsController = postcardsController;
    
    [rootViewController release];
    [postcardsController release];
    
    return YES;
}

- (void)dealloc;
{
    [_postcardsController release];
    [super dealloc];
}

#pragma mark Postcard on the Run

- (BOOL)allowPhotoEditing;
{
    return YES;
}

- (BOOL)allowStatisticsGathering;
{
    return YES;
}

- (BOOL)useLocationServices;
{
    return YES;
}

- (BOOL)showCancelButton;
{
    return YES;
}

- (UIColor *)tintColor;
{
    return [UIColor colorWithRed:( 158.0f / 255.0f ) green:( 141.0f / 255.0f ) blue:( 94.0f / 255.0f ) alpha:1.0f];
}

- (void)pcotr:(UIViewController *)pcotr canceled:(BOOL)canceled;
{
    if ( !canceled )
    {
        NSString *title = NSLocalizedString( @"Postcard Sent!", @"" );
        NSString *message = NSLocalizedString( @"Your card will arrive in 3-5 business days.", @"" );
        NSString *button = NSLocalizedString( @"Okay", @"" );
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:button otherButtonTitles:nil];
        
        [alert show];
        [alert release];
    }
    
    [pcotr dismissModalViewControllerAnimated:YES];
}

@end
