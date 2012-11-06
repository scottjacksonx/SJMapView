# SJMapView #

SJMapView is a drop-in MKMapView subclass that detects status bar taps (and by default, scrolls to the user's location).

## Use ##

Copy `SJMapView.h` and `SJMapView.m` into your project and wherever you were initialising your map view (either programatically or in a NIB), change your map view from an MKMapView to an SJMapView.

## Extras ##

You can be notified when status-bar-tap-related things happen by setting your `SJMapView`'s `statusBarTapDelegate` property to something that conforms to the `SJStatusBarTapDelegate` and implementing some delegate methods.

`- (void)mapView:(SJMapView *)mapView didGoFromCoordinate:(CLLocationCoordinate2D)fromCoordinate toUserLocation:(CLLocationCoordinate2D)toCoordinate` lets the map view's status bar delegate know when a user has tapped the status bar and the map view has scrolled from its previous location to the user's location.

Alternatively, if you just want to detect status bar taps and do your own thing rather than scroll the map view to the user's location, implement `- (void)mapViewStatusBarTapDetected:(SJMapView *)mapview` and the map view's status bar delegate will be notified when the user taps the status bar.


