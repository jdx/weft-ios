//
//  ViewController.h
//  weft
//
//  Created by Jeff Dickey on 12/1/12.
//  Copyright (c) 2012 weft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "AFNetworking.h"
#import <CoreLocation/CoreLocation.h>

@interface FakeDeviceViewController : UIViewController<MKMapViewDelegate>

- (void) mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation;

@end