//
//  HotelRootViewController_iPhone.h
//  hotel
//
//  Created by Marc Charbonneau on 2/10/12.
//  Copyright (c) 2012 ELC Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PCWorkflowController.h"

@interface HotelRootViewController_iPhone : UIViewController <UIWebViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, PCWorkflowControllerDelegate>
{
    UIWebView *_webView;
    UIImageView *_imageView;
    UIActivityIndicatorView *_activityIndicator;
    UIButton *_navButton;
    PCWorkflowController *_postcardsController;    
}

@property(retain, nonatomic) IBOutlet UIWebView *webView;
@property(retain, nonatomic) IBOutlet UIImageView *imageView;
@property(retain, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property(retain, nonatomic) IBOutlet UIButton *navButton;
@property(retain, nonatomic) PCWorkflowController *postcardsController;

- (IBAction)loadProfile:(id)sender;
- (IBAction)sendPostcard:(id)sender;
- (IBAction)showPostcardInfo:(id)sender;

@end
