//
//  HotelRootViewController_iPhone.m
//  hotel
//
//  Created by Marc Charbonneau on 2/10/12.
//  Copyright (c) 2012 ELC Technologies. All rights reserved.
//

#import "HotelRootViewController_iPhone.h"
#import "PostcardInfoViewController.h"

@implementation HotelRootViewController_iPhone

@synthesize webView = _webView;
@synthesize imageView = _imageView;
@synthesize activityIndicator = _activityIndicator;
@synthesize navButton = _navButton;
@synthesize postcardsController = _postcardsController;

#pragma mark API

- (IBAction)loadProfile:(id)sender;
{
	NSURL *URL = [NSURL URLWithString:@"http://m.runtriz.com/viceroyanguilla/app/iphone/index.php"];
	NSURLRequest *request = [NSURLRequest requestWithURL:URL];
	
    [self.imageView setHidden:NO];
	[self.webView loadRequest:request];
}

- (IBAction)sendPostcard:(id)sender;
{
    [sender dismissModalViewControllerAnimated:NO];
    
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

- (IBAction)showPostcardInfo:(id)sender;
{
    PostcardInfoViewController *postcard = [[PostcardInfoViewController alloc] initWithNibName:@"PostcardInfoViewController" bundle:nil];
    [self presentModalViewController:postcard animated:YES];
    [postcard setDelegate:self];
    [postcard release];
}

#pragma POTR

- (BOOL)allowPhotoEditing;
{
    return YES;
}

- (BOOL)allowStatisticsGathering;
{
    return NO;
}

- (BOOL)allowSmellMail;
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

#pragma mark UIViewController

- (void)viewDidLoad;
{
    [super viewDidLoad];
    
    PCWorkflowController *postcardsController = [[PCWorkflowController alloc] initWithAPIKey:@"68d147ab9464e15545dbc86b3ee835829ee99cb"];
    postcardsController.delegate = self;
    self.postcardsController = postcardsController;

    [self.webView setDelegate:self];
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
    return ( interfaceOrientation == UIInterfaceOrientationPortrait );
}

#pragma mark NSObject

- (void)dealloc;
{
    [_webView release];
    [_imageView release];
    [_activityIndicator release];
    [_navButton release];
    [_postcardsController release];
    
    
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
    
    [self dismissModalViewControllerAnimated:NO];
    
    if ( ![self.postcardsController isValidPostcardPhoto:photo] )
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
        UIViewController *viewController = [self.postcardsController modalViewControllerForPhoto:photo];
        [self presentModalViewController:viewController animated:YES];
    }
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
