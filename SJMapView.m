//
//  SJMapView.m
//  Departing
//
//  Created by Scott Jackson on 6/11/12.
//  Copyright (c) 2012 Scott Jackson. All rights reserved.
//

#import "SJMapView.h"

@implementation SJMapView

/*
 Called when the map view is created programatically.
 */
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
		[self startDetectingStatusBarTaps];
    }
    return self;
}

/*
 Called when the map view is created from inside a NIB.
 */
- (void)awakeFromNib {
	[self startDetectingStatusBarTaps];
}

- (void)startDetectingStatusBarTaps {
	UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
	scrollView.delegate = self;
	[self addSubview:scrollView];
	[self sendSubviewToBack:scrollView];
	scrollView.contentSize = CGSizeMake(scrollView.frame.size.width, scrollView.frame.size.height+10);
	scrollView.contentOffset = CGPointMake(0, 1);
	scrollView.scrollsToTop = YES;
}


- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView {
	/*
	 If our statusBarTapDelegate implements its own mapViewStatusBarTapDetected: method, do that.
	 Otherwise, do the default (scroll to user location, if the map view can do that — fail loudly if it can't).
	 */
	if ([self.statusBarTapDelegate respondsToSelector:@selector(mapViewStatusBarTapDetected:)]) {
		[self.statusBarTapDelegate mapViewStatusBarTapDetected:self];
	} else {
		NSAssert(self.showsUserLocation, @"map view doesn't show user location, so can't scroll to user location");
		self.previousCoordinate = self.centerCoordinate;
		[self setCenterCoordinate:self.userLocation.coordinate animated:YES];
		if ([self.statusBarTapDelegate respondsToSelector:@selector(mapViewStatusBarTapDetected:)]) {
			[self.statusBarTapDelegate mapView:self
						   didGoFromCoordinate:self.previousCoordinate
								  toUserLocation:self.userLocation.coordinate];
		}
	}
	return NO;
}

@end
