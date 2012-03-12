//
//  MyFacebookPhotosAppDelegate.m
//  MyFacebookPhotos
//
//  Created by Purnama Santo on 3/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MyFacebookPhotosAppDelegate.h"
#import "MyFacebookPhotosViewController.h"

#define FB_APP_ID @"39624508329"


@implementation MyFacebookPhotosAppDelegate

@synthesize facebook = _facebook;
@synthesize window = _window;
@synthesize viewController = _viewController;


- (void)dealloc
{
  [_facebook release];
  [_window release];
  [_viewController release];
    [super dealloc];
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  _facebook = [[Facebook alloc] initWithAppId:FB_APP_ID andDelegate:self];

  // deal with fb login...
  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
  if ([defaults objectForKey:@"FBAccessTokenKey"] 
      && [defaults objectForKey:@"FBExpirationDateKey"]) {
    _facebook.accessToken = [defaults objectForKey:@"FBAccessTokenKey"];
    _facebook.expirationDate = [defaults objectForKey:@"FBExpirationDateKey"];
  }

  if (![_facebook isSessionValid]) {
    [_facebook authorize:nil];
  }
  else {
    [self displayThumbView];
  }

  return YES;
}


// For iOS 4.2+ support
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
  return [_facebook handleOpenURL:url]; 
}


#pragma mark - FBSessionDelegate

- (void)fbDidLogin {
  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
  [defaults setObject:[_facebook accessToken] forKey:@"FBAccessTokenKey"];
  [defaults setObject:[_facebook expirationDate] forKey:@"FBExpirationDateKey"];
  [defaults synchronize];

  [self displayThumbView];
}


- (void)displayThumbView {
  self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
  self.viewController = [[[MyFacebookPhotosViewController alloc] initWithFacebook:_facebook] autorelease];
  self.window.rootViewController = self.viewController;
  [self.window makeKeyAndVisible];
}

@end
