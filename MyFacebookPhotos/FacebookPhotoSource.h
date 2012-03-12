//
//  FacebookPhotoSource.h
//  MyFacebookPhotos
//
//  Created by Purnama Santo on 3/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Three20/Three20.h>
#import "FBConnect.h"


typedef enum {
  idle,
  loading,
  loaded
} LoadState;



@interface FacebookPhotoSource : TTModel <TTPhotoSource, FBRequestDelegate> {
  NSArray *_photos;
  Facebook *_facebook;
  LoadState _loadState;
  int _page;
  NSString *_title;
}

- (id)initWithFacebook:(Facebook*)facebook;

@property (nonatomic, retain) NSArray *photos;

@end