//
//  SJMapView.h
//  Departing
//
//  Created by Scott Jackson on 6/11/12.
//  Copyright (c) 2012 Scott Jackson. All rights reserved.
//

#import <MapKit/MapKit.h>

/*
 SJMapView is an MKMapView subclass that detects status bar taps. By default,
 a status bar tap scrolls the map view to the user's location, but if you want,
 you can detect status bar taps and do your own thing.
 */

@class SJMapView;

@protocol SJStatusBarTapDelegate <NSObject>
@optional
- (void)mapViewStatusBarTapDetected:(SJMapView *)mapview;
- (void)mapView:(SJMapView *)mapView didGoFromCoordinate:(CLLocationCoordinate2D)fromCoordinate toUserLocation:(CLLocationCoordinate2D)toCoordinate;
@end

@interface SJMapView : MKMapView<UIScrollViewDelegate>

@property CLLocationCoordinate2D previousCoordinate;
@property id<SJStatusBarTapDelegate> statusBarTapDelegate;

@end
