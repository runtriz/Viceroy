//
//  HotelRootViewController.m
//  hotel
//
//  Created by Marc Charbonneau on 12/12/11.
//  Copyright (c) 2011 ELC Technologies. All rights reserved.
//

#import "HotelRootViewController.h"
#import "PCWorkflowController.h"
#import "hotelAppDelegate_iPhone.h"

@implementation HotelRootViewController

#pragma mark API

@synthesize webView = _webView;
@synthesize activityIndicator = _activityIndicator;
@synthesize navButton = _navButton;

- (IBAction)loadProfile:(id)sender;
{
	NSURL *URL = [NSURL URLWithString:@"http://m.runtriz.com/viceroyanguilla/app/iphone/index.php"];
	NSURLRequest *request = [NSURLRequest requestWithURL:URL];
	
    [self.webView setHidden:YES];
	[self.webView loadRequest:request];
}

- (IBAction)sendPostcard:(id)sender;
{
    if ( [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera] )
    {
        UIImagePickerController *controller = [[UIImagePickerController alloc] init];
        
        controller.sourceType = UIImagePickerControllerSourceTypeCamera;
        controller.cameraCaptureMode = UIImagePickerControllerCameraCaptureModePhoto;
        controller.cameraDevice = UIImagePickerControllerCameraDeviceRear;
        controller.delegate = self;
        controller.allowsEditing = NO;
        
        [self presentModalViewController:controller animated:YES];
        [controller release];
    }
    else
    {
        NSString *title = NSLocalizedString( @"Camera Unavailable", @"" );
        NSString *message = NSLocalizedString( @"Camera is not available for your device.", @"" );
        NSString *button = NSLocalizedString( @"Okay", @"" );
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:button otherButtonTitles:nil];
        
        [alert show];
        [alert release];
    }
}

#pragma mark UIViewController

- (void)viewDidLoad;
{
    [super viewDidLoad];

    [self.webView setHidden:YES];
    [self.webView setDelegate:self];
    
    [self loadProfile:self];
}

- (void)viewDidUnload;
{
    [super viewDidUnload];

    self.webView = nil;
    self.activityIndicator = nil;
    self.navButton = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation;
{
    return ( interfaceOrientation == UIInterfaceOrientationPortrait );
}

#pragma mark NSObject

- (void)dealloc;
{
    [_webView release];
    [_activityIndicator release];
    [_navButton release];
    
	[super dealloc];
}

#pragma mark UIImagePickerControllerDelegate

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker;
{
    [self dismissModalViewControllerAnimated:YES];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info;
{
    UIImage *photo = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    PCWorkflowController *postcardsController = [((hotelAppDelegate_iPhone *)[[UIApplication sharedApplication] delegate]) postcardsController];
    
    [self dismissModalViewControllerAnimated:NO];
    
    if ( ![postcardsController isValidPostcardPhoto:photo] )
    {
        NSString *title = NSLocalizedString( @"Photo Not Usable", @"" );
        NSString *message = NSLocalizedString( @"Sorry, the photo you took does not have sufficient resolution for printing. Please try again.", @"" );
        NSString *button = NSLocalizedString( @"Okay", @"" );
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:button otherButtonTitles:nil];
        
        [alert show];
        [alert release];
    }
    else if ( photo == nil )
    {
        NSString *title = NSLocalizedString( @"Photo Error", @"" );
        NSString *message = NSLocalizedString( @"Please try again.", @"" );
        NSString *button = NSLocalizedString( @"Okay", @"" );
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:button otherButtonTitles:nil];
        
        [alert show];
        [alert release];
    }
    else
    {
        UIViewController *viewController = [postcardsController modalViewControllerForPhoto:photo];
        [self presentModalViewController:viewController animated:YES];
    }
}

#pragma mark UIWebViewDelegate

-(void)webViewDidStartLoad:(UIWebView *)webView;
{
	[self.activityIndicator startAnimating];
    [webView setHidden:YES];
	
}
-(void)webViewDidFinishLoad:(UIWebView *)webView;
{
	[self.activityIndicator stopAnimating];
	[webView setHidden:NO];
}

@end
