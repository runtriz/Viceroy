//
//  hotelAppDelegate_iPad.h
//  hotel
//
//  Created by Matthew Allard on 4/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "hotelAppDelegate.h"

@interface hotelAppDelegate_iPad : hotelAppDelegate<UIWebViewDelegate> {
    IBOutlet UIWebView *webView;
	IBOutlet UIActivityIndicatorView *activityIndicator;
    IBOutlet UIButton *navButton;
}

@property(nonatomic,retain) UIWebView *webView;
@property(nonatomic,retain) UIActivityIndicatorView *activityIndicator;
@property(nonatomic,retain) UIButton *navButton;

-(IBAction) loadProfile:(id)sender;

@end
