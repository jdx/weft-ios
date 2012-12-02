//
//  ViewController.m
//  weft
//
//  Created by Jeff Dickey on 12/1/12.
//  Copyright (c) 2012 weft. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void) mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    NSLog(@"%@", [userLocation.location description]);
    NSURL *url = [NSURL URLWithString:@"https://alpha-api.app.net/stream/0/posts/stream/global"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        NSLog(@"App.net Global Stream: %@", JSON);
    } failure:nil];
    [operation start];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
