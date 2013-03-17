//  StateViewController.h


#import <UIKit/UIKit.h>
#import "VectorGeographicView.h"

@class MapperViewController;

@interface StateViewController : UIViewController {
	VectorGeographicView *vectorGeographicView;
	MapperViewController *parentController;
	NSString *selectedState;
}

-(void)loadMap;

@property (nonatomic, retain) VectorGeographicView *vectorGeographicView;
@property (nonatomic, retain) MapperViewController *parentController;
@property (nonatomic, retain) NSString *selectedState;
@end
