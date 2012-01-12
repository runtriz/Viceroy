//
//  HotelRootViewController.h
//  hotel
//
//  Created by Marc Charbonneau on 12/12/11.
//  Copyright (c) 2011 ELC Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PCWorkflowController.h"


@interface HotelRootViewController_iPhone : UIViewController <UIWebViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, PCWorkflowControllerDelegate>
{
    UIWebView *_webView;
    UIActivityIndicatorView *_activityIndicator;
    UIButton *_navButton;
    
    PCWorkflowController *_postcardsController;

}

@property(nonatomic,retain) IBOutlet UIWebView *webView;
@property(nonatomic,retain) IBOutlet UIActivityIndicatorView *activityIndicator;
@property(nonatomic,retain) IBOutlet UIButton *navButton;
@property(retain, nonatomic) PCWorkflowController *postcardsController;


- (IBAction)loadProfile:(id)sender;
- (IBAction)sendPostcard:(id)sender;

@end
