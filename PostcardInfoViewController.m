//
//  PostcardInfoViewController.m
//  hotel
//
//  Created by Marc Charbonneau on 3/1/12.
//  Copyright (c) 2012 ELC Technologies. All rights reserved.
//

#import "PostcardInfoViewController.h"

@interface PostcardInfoViewController ()

@end

@implementation PostcardInfoViewController

@synthesize scrollView = _scrollView;
@synthesize delegate = _delegate;

- (IBAction)sendPostcard:(id)sender;
{
    if ( [self.delegate respondsToSelector:@selector(sendPostcard:)] )
        [self.delegate sendPostcard:self];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.scrollView.contentSize = CGSizeMake( 320.0f, 545.0f );
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
