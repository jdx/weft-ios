#import "FakeDeviceViewController.h"

@interface FakeDeviceViewController ()

@end

@implementation FakeDeviceViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    NSURL *url = [NSURL URLWithString:@"http://weft.io/device"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"POST";
    NSString *params = [NSString stringWithFormat:@"lat=%f&lon=%f", userLocation.coordinate.latitude, userLocation.coordinate.longitude];
    request.HTTPBody = [params dataUsingEncoding:NSUTF8StringEncoding];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:nil failure:nil];
    [operation start];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
