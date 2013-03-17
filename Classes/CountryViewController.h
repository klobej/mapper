//  CountryViewController.h


#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "VectorGeographicView.h"

@class MapperViewController;

@interface CountryViewController : UIViewController  {
		
	VectorGeographicView *vectorGeographicView;
	MapperViewController *parentController;
}

-(void)loadMap;

@property (nonatomic, retain) VectorGeographicView *vectorGeographicView;
@property (nonatomic, retain) MapperViewController *parentController;

@end
