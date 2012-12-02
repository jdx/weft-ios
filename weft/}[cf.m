//
//  MainViewController.m
//  weft
//
//  Created by Jeff Dickey on 12/1/12.
//  Copyright (c) 2012 weft. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController
@synthesize button1;
@synthesize button2;
@synthesize mapView;
@synthesize pin;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [NSTimer scheduledTimerWithTimeInterval:1.0
                                     target:self
                                   selector:@selector(updateBikeLocation)
                                   userInfo:nil
                                    repeats:YES];
}

- (void)updateBikeLocation
{
    NSURL *url = [NSURL URLWithString:@"http://weft.io/device.json"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        id location = [JSON objectForKey:@"location"];
        float lat = [[location objectForKey:@"lat"] floatValue];
        float lon = [[location objectForKey:@"lon"] floatValue];
        if (pin == nil) pin = [[MKPointAnnotation alloc] init];
        pin.coordinate = CLLocationCoordinate2DMake(lat, lon);
        pin.title = @"My Bike";
        [mapView addAnnotation:pin];
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        NSLog(@"%@", error);
    }];
    [operation start];
}

-(MKAnnotationView *)mapView:(MKMapView *)map viewForAnnotation:(id<MKAnnotation>)annotation
{
    //if annotation is the user location, return nil to get default blue-dot...
    if ([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    
    //create purple pin view for all other annotations...
    static NSString *reuseId = @"pin";
    
    MKPinAnnotationView *myPersonalView = (MKPinAnnotationView *)[map dequeueReusableAnnotationViewWithIdentifier:reuseId];
    if (myPersonalView == nil)
    {
        myPersonalView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:reuseId];
        myPersonalView.pinColor = MKPinAnnotationColorRed;
        myPersonalView.canShowCallout = YES;
    }
    else
    {
        //if re-using view from another annotation, point view to current annotation...
        myPersonalView.annotation = annotation;
    }
    
    return myPersonalView;
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    // update location?
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)unhideButtons
{
    button1.hidden = !button1.hidden;
    button2.hidden = !button2.hidden;
}

@end
