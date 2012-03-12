//
//  MyFacebookPhotosViewController.m
//  MyFacebookPhotos
//
//  Created by Purnama Santo on 3/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MyFacebookPhotosViewController.h"
#import "FacebookPhotoSource.h"


@implementation MyFacebookPhotosViewController

@synthesize facebook = _facebook;


- (id)initWithFacebook:(Facebook*)facebook {
  self = [super init];
  if (self)
    self.facebook = facebook;
  
  return self;
}


- (void)dealloc {
  self.facebook = nil;
  self.photoSource = nil;
  [super dealloc];
}


- (void)viewDidLoad
{
  [super viewDidLoad];

  self.photoSource = [[[FacebookPhotoSource alloc] initWithFacebook:_facebook] autorelease];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
