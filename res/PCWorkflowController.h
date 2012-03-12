//
//  PCWorkflowController.h
//  PCOTR SDK
//
//  Created by Marc Charbonneau on 7/12/11.
//  Copyright 2011 ELC Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PCWorkflowControllerDelegate;

@interface PCWorkflowController : NSObject <UINavigationControllerDelegate>
{
    id<PCWorkflowControllerDelegate> _delegate;
}

@property(assign, nonatomic) __weak id<PCWorkflowControllerDelegate> delegate;
@property(readonly, nonatomic) CGSize minPhotoResolution;

- (id)initWithAPIKey:(NSString *)APIKey;

// Returns NO if postcardPhoto does not meet the minimum resolution 
// requirements for printing.

- (BOOL)isValidPostcardPhoto:(UIImage *)postcardPhoto;

// Returns a view controller to start the PCOTR workflow. You must add the view
// controller to a UINavigationController for it to function properly. Use this
// method if you want to integrate PCOTR into an existing navigation hierarchy
// in your app. Raises an exception if postcardPhoto does not meet the minimum
// resolution requirements. 

- (UIViewController *)viewControllerForPhoto:(UIImage *)postcardPhoto;

// Returns a view controller which can be used as a stand-alone modal view
// controller. Use this method if your app does not have a suitable navigation 
// controller. Raises an exception if postcardPhoto does not meet the minimum
// resolution requirements. 

- (UIViewController *)modalViewControllerForPhoto:(UIImage *)postcardPhoto;

@end

@protocol PCWorkflowControllerDelegate <NSObject>

@optional

- (BOOL)allowPhotoEditing;
- (BOOL)allowStatisticsGathering;
- (BOOL)allowSmellMail;
- (BOOL)useLocationServices;
- (BOOL)showCancelButton;
- (UIColor *)tintColor;
- (NSString *)partnerName; 

@required

// Called when the user completes the PCOTR workflow. It is your responsibility
// to dismiss the view controller and show a confirmation if necessary.

- (void)pcotr:(UIViewController *)pcotr canceled:(BOOL)canceled;

@end
