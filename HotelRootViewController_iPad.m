//
//  HotelRootViewController_iPad.m
//  hotel
//
//  Created by Marc Charbonneau on 2/10/12.
//  Copyright (c) 2012 ELC Technologies. All rights reserved.
//

#import "HotelRootViewController_iPad.h"

@implementation HotelRootViewController_iPad

@synthesize webView = _webView;
@synthesize imageView = _imageView;
@synthesize activityIndicator = _activityIndicator;
@synthesize navButton = _navButton;

#pragma mark API

-(IBAction)loadProfile:(id)sender;
{
	NSURL *url = [NSURL URLWithString:@"http://m.runtriz.com/viceroyanguilla/app/ipad/index.php"];
	NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
	
    [self.imageView setHidden:NO];
	[self.webView loadRequest:requestObj];
}

#pragma mark UIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self loadProfile:self];
}

- (void)viewDidUnload;
{
    [super viewDidUnload];
    
    self.webView = nil;
    self.imageView = nil;
    self.activityIndicator = nil;
    self.navButton = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation;
{
	return YES;
}

#pragma mark NSObject

- (void)dealloc;
{    
    [_webView release];
    [_imageView release];
    [_activityIndicator release];
    [_navButton release];
	[super dealloc];
}

#pragma mark UIWebViewDelegate

-(void)webViewDidStartLoad:(UIWebView *)webView;
{
	[self.activityIndicator startAnimating];
	
}
-(void)webViewDidFinishLoad:(UIWebView *)webView;
{
    [self.imageView setHidden:YES];
	[self.activityIndicator stopAnimating];
}

@end
