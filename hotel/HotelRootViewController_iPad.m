//
//  HotelRootViewController~iPad.m
//  hotel
//
//  Created by David Sklenar on 1/11/12.
//  Copyright (c) 2012 ELC Technologies. All rights reserved.
//

#import "HotelRootViewController_iPad.h"

@implementation HotelRootViewController_iPad
@synthesize webView, activityIndicator,navButton;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    // Override point for customization after application launch.
    [webView setHidden:YES];
    [navButton setHidden:YES];
	NSString *urlAddress = @"http://m.runtriz.com/viceroyanguilla/app/ipad/index.php";
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
    
    
}

-(IBAction)loadProfile:(id) sender {
	[webView setHidden:YES];
	NSString *urlAddress = @"http://m.runtriz.com/viceroyanguilla/app/ipad/index.php";
	
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


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

- (void)dealloc {
    
    [webView release];
    [activityIndicator release];
    [navButton release];
	[super dealloc];
}

@end
