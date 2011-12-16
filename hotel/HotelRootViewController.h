//
//  HotelRootViewController.h
//  hotel
//
//  Created by Marc Charbonneau on 12/12/11.
//  Copyright (c) 2011 ELC Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HotelRootViewController : UIViewController <UIWebViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
{
    UIWebView *_webView;
    UIActivityIndicatorView *_activityIndicator;
    UIButton *_navButton;
}

@property(nonatomic,retain) IBOutlet UIWebView *webView;
@property(nonatomic,retain) IBOutlet UIActivityIndicatorView *activityIndicator;
@property(nonatomic,retain) IBOutlet UIButton *navButton;

- (IBAction)loadProfile:(id)sender;
- (IBAction)sendPostcard:(id)sender;

@end
