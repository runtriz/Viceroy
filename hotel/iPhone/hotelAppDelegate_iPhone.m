//
//  hotelAppDelegate_iPhone.m
//  hotel
//
//  Created by Matthew Allard on 4/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "hotelAppDelegate_iPhone.h"

@implementation hotelAppDelegate_iPhone
@synthesize webView, activityIndicator, navButton;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    [webView setHidden:YES];
    //[navButton setHidden:YES];
	NSString *urlAddress = @"http://m.runtriz.com/viceroyanguilla/app/iphone/index.php";
	NSURL *url = [NSURL URLWithString:urlAddress];
	NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
	
	//NSURLResponse *resp = nil;
	NSError *err = nil;
	//NSData *response = [NSURLConnection sendSynchronousRequest: requestObj returningResponse: &resp error: &err];
	if (err != nil) {
		UIAlertView *alertView = [[UIAlertView alloc] initWithTitle: @"Network Error" 
															message: @"We have detected that you are not connected to the internet! Please connect to a network and try again!" delegate:self
												  cancelButtonTitle:@"OK"
												  otherButtonTitles:nil];
		[alertView  show];
		[alertView  release];
	}
	
	[webView loadRequest:requestObj];
    
    return YES;
}
-(IBAction)loadProfile:(id) sender {
	[webView setHidden:YES];
	NSString *urlAddress = @"http://m.runtriz.com/viceroyanguilla/app/iphone/index.php";
	
	NSURL *url = [NSURL URLWithString:urlAddress];
	NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
	
	[webView loadRequest:requestObj];
    //[navButton setHidden:YES];
}


-(void)webViewDidStartLoad:(UIWebView *)webView {
	[activityIndicator startAnimating];
    [webView setHidden:YES];
	
}
-(void)webViewDidFinishLoad:(UIWebView *)webView {
	[activityIndicator stopAnimating];
	[webView setHidden:NO];
}

- (BOOL)webView:(UIWebView*)webView shouldStartLoadWithRequest:(NSURLRequest*)request navigationType:(UIWebViewNavigationType)navigationType {
    
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
    [webView release];
    [activityIndicator release];
    [navButton release];
	[super dealloc];
}

@end
