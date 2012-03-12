//
//  PostcardInfoViewController.h
//  hotel
//
//  Created by Marc Charbonneau on 3/1/12.
//  Copyright (c) 2012 ELC Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PostcardInfoViewController : UIViewController

@property(retain, nonatomic) IBOutlet UIScrollView *scrollView;
@property(retain, nonatomic) id delegate;

- (IBAction)sendPostcard:(id)sender;

@end
