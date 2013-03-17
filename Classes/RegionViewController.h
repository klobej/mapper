//  RegionViewController.h


#import <UIKit/UIKit.h>
#import "VectorGeographicView.h"

@interface RegionViewController : UIViewController {
	VectorGeographicView *vectorGeographicView;
}


-(void)loadMap;


@property (nonatomic, retain) VectorGeographicView *vectorGeographicView;


@end
