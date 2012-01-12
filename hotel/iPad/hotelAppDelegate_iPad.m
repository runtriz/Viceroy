//
//  hotelAppDelegate_iPad.m
//  hotel
//
//  Created by Matthew Allard on 4/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "hotelAppDelegate_iPad.h"
#import "HotelRootViewController_iPad.h"

@implementation hotelAppDelegate_iPad


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    HotelRootViewController_iPad *rootViewController = [[HotelRootViewController_iPad alloc] initWithNibName:@"HotelRootViewController_iPad" bundle:nil];
       
    [self.window makeKeyAndVisible];
    [self.window setRootViewController:rootViewController];
    
    
    [rootViewController release];
    
    return YES;
}





-(BOOL)webView:(UIWebView*)webView shouldStartLoadWithRequest:(NSURLRequest*)request navigationType:(UIWebViewNavigationType)navigationType {
    
    /*
    //CAPTURE USER LINK-CLICK.
    if (navigationType == UIWebViewNavigationTypeLinkClicked) {
        NSURL *URL = [request URL];   
        if ([[URL scheme] isEqualToString:@"http"]) {
            [navButton setHidden:NO];
            //[[UIApplication sharedApplication] openURL:URL];
            return YES;
        }
        //else if ([[URL scheme] isEqualToString:@"mailto"])  {
        //    [[UIApplication sharedApplication] openURL:URL];
        //    return NO;
        //}
    }
     */
    return YES;  
}
- (void)dealloc
{

}


@end
