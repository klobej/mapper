//  StateViewController.m

#import "StateViewController.h"
#import "StatesMarkupManagerObject.h"

@implementation StateViewController

@synthesize vectorGeographicView, parentController, selectedState;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		self.view.autoresizesSubviews = NO;
    }
    return self;
}

- (void)viewDidLoad {
	self.view.backgroundColor = [UIColor clearColor];
	self.view.autoresizesSubviews = NO;
	[super viewDidLoad];
	
}


-(void)loadMap
{
	NSArray *keysArray = [NSArray arrayWithObject:selectedState];

	NSMutableArray *statesAr = [NSMutableArray arrayWithCapacity:0];
	for (int i = 0; i < [keysArray count]; i++)
	{
		NSDictionary *stateObject = [NSDictionary dictionaryWithObject:[[StatesMarkupManagerObject statesMarkupManagerObject].statesMasterDictionary objectForKey:[keysArray objectAtIndex:i]] forKey:[keysArray objectAtIndex:i]];
		[statesAr addObject:stateObject];
	}
	
    if (vectorGeographicView)
	{
		[vectorGeographicView removeFromSuperview];
		[vectorGeographicView release];
	}
	self.vectorGeographicView = [[VectorGeographicView alloc] initWithFrame:CGRectMake(0,0,self.view.frame.size.width, self.view.frame.size.height)];
	self.vectorGeographicView.backgroundColor = [UIColor clearColor];
	self.vectorGeographicView.statesArray = statesAr;
	self.vectorGeographicView.doStretch = YES;
	self.vectorGeographicView.xAnchor = 5;
	self.vectorGeographicView.yAnchor = 1;
	[self.view addSubview:vectorGeographicView];	
}



- (void)dealloc {
    [super dealloc];
}


@end
