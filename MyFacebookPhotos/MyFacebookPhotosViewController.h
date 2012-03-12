//
//  MyFacebookPhotosViewController.h
//  MyFacebookPhotos
//
//  Created by Purnama Santo on 3/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Three20/Three20.h>
#import "FBConnect.h"


@interface MyFacebookPhotosViewController : TTThumbsViewController <TTThumbsViewControllerDelegate> {
  Facebook *_facebook;
}

- (id)initWithFacebook:(Facebook*)facebook;

@property (nonatomic, retain) Facebook *facebook;

@end
