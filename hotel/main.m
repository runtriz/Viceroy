//
//  main.m
//  hotel
//
//  Created by Matthew Allard on 4/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "hotelAppDelegate.h"


int main(int argc, char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    int retVal = UIApplicationMain(argc, argv, nil, NSStringFromClass([hotelAppDelegate class]));
    [pool release];
    return retVal;
}
