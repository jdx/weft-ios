//
//  MainViewController.h
//  weft
//
//  Created by Jeff Dickey on 12/1/12.
//  Copyright (c) 2012 weft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "AFNetworking.h"

@interface MainViewController : UIViewController<MKMapViewDelegate>
{
    BOOL hasAlerted;
}

@property (nonatomic, retain) IBOutlet UIButton *button1;
@property (nonatomic, retain) IBOutlet UIButton *button2;
@property (nonatomic, retain) IBOutlet MKMapView *mapView;
@property (nonatomic, retain) IBOutlet MKPointAnnotation *pin;

- (IBAction)unhideButtons;
- (void)updateBikeLocation;

@end
