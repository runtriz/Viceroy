//
//  hotelAppDelegate_iPhone.h
//  hotel
//
//  Created by Matthew Allard on 4/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "hotelAppDelegate.h"
#import "PCWorkflowController.h"

@interface hotelAppDelegate_iPhone : hotelAppDelegate<PCWorkflowControllerDelegate>
{
    PCWorkflowController *_postcardsController;
}

@property(retain, nonatomic) PCWorkflowController *postcardsController;

@end
