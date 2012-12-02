#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "AFNetworking.h"

@interface FakePhoneViewController : UIViewController<CLLocationManagerDelegate> {
    CLLocationManager *locationManager;
    IBOutlet UIButton *startTrackingButton;
    IBOutlet UILabel  *alertLabel;
}

@property(nonatomic, retain) CLLocationManager *locationManager;
@property(nonatomic, retain) IBOutlet UIButton *startTrackingButton;
@property(nonatomic, retain) IBOutlet UILabel  *alertLabel;
- (IBAction)startTracking:(id)sender;

@end