//
//  FakePhoneViewController.m
//  weft
//
//  Created by Jeff Dickey on 12/1/12.
//  Copyright (c) 2012 weft. All rights reserved.
//

#import "FakePhoneViewController.h"

@interface FakePhoneViewController ()

@end

@implementation FakePhoneViewController

@synthesize startTrackingButton;
@synthesize locationManager;
@synthesize alertLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
    locationManager = [[CLLocationManager alloc] init];
    [locationManager setDelegate:self];
    // Only applies when in foreground otherwise it is very significant changes
    [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startTracking:(id)sender {
    [locationManager startUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    id newLocation = [locations objectAtIndex:0];
    CLLocationCoordinate2D userLocation = [newLocation coordinate];
    [alertLabel setText:@"Location Has been found"];
    [alertLabel setHidden:NO];
    
    NSURL *url = [NSURL URLWithString:@"http://weft.io/phone"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"POST";
    NSString *params = [NSString stringWithFormat:@"lat=%f&lon=%f", userLocation.latitude, userLocation.longitude];
    request.HTTPBody = [params dataUsingEncoding:NSUTF8StringEncoding];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:nil failure:nil];
    [operation start];
}
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"Unable to start location manager. Error:%@", [error description]);
    [alertLabel setHidden:NO];
}

@end
