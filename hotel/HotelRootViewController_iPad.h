//
//  HotelRootViewController~iPad.h
//  hotel
//
//  Created by David Sklenar on 1/11/12.
//  Copyright (c) 2012 ELC Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HotelRootViewController_iPad : UIViewController <UIWebViewDelegate> {
   UIWebView *webView;
   UIActivityIndicatorView *activityIndicator;
   UIButton *navButton;
}

@property(nonatomic,retain) IBOutlet UIWebView *webView;
@property(nonatomic,retain) IBOutlet UIActivityIndicatorView *activityIndicator;
@property(nonatomic,retain) IBOutlet UIButton *navButton;

-(IBAction) loadProfile:(id)sender;
@end
