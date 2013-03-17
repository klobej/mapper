//  MapperViewController.h

#import <UIKit/UIKit.h>
#import "CountryViewController.h"
#import "StateViewController.h"
#import "RegionViewController.h"

@interface MapperViewController : UIViewController {

	CountryViewController *countryViewController;
	StateViewController *stateViewController;
	RegionViewController *regionViewController;
}

-(void)stateSelected:(NSString *)stateSelected;

@property (nonatomic, retain) CountryViewController *countryViewController;
@property (nonatomic, retain) StateViewController *stateViewController;
@property (nonatomic, retain) RegionViewController *regionViewController;
@end

