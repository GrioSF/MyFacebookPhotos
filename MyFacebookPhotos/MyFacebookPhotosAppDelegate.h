//
//  MyFacebookPhotosAppDelegate.h
//  MyFacebookPhotos
//
//  Created by Purnama Santo on 3/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FBConnect.h"


@class MyFacebookPhotosViewController;

@interface MyFacebookPhotosAppDelegate : UIResponder <UIApplicationDelegate, FBSessionDelegate> {
  Facebook *_facebook;
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) MyFacebookPhotosViewController *viewController;
@property (nonatomic, retain) Facebook *facebook;

- (void)displayThumbView;
@end
