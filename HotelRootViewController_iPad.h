//
//  HotelRootViewController_iPad.h
//  hotel
//
//  Created by Marc Charbonneau on 2/10/12.
//  Copyright (c) 2012 ELC Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HotelRootViewController_iPad : UIViewController <UIWebViewDelegate> 
{
    UIWebView *_webView;
    UIImageView *_imageView;
    UIActivityIndicatorView *_activityIndicator;
    UIButton *_navButton;
}

@property(retain, nonatomic) IBOutlet UIWebView *webView;
@property(retain, nonatomic) IBOutlet UIImageView *imageView;
@property(retain, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property(retain, nonatomic) IBOutlet UIButton *navButton;

-(IBAction)loadProfile:(id)sender;

@end
