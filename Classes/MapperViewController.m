//  MapperViewController.m

#import "MapperViewController.h"
#import "CountryViewController.h"

@implementation MapperViewController

@synthesize countryViewController, stateViewController, regionViewController;

-(void)loadCountryViewController
{
    countryViewController = [[CountryViewController alloc] initWithNibName:@"CountryViewController" bundle:nil];
	countryViewController.parentController = self;
	regionViewController = [[RegionViewController alloc] initWithNibName:nil bundle:nil];
	
	
	switch ([UIApplication sharedApplication].statusBarOrientation) {
		case UIInterfaceOrientationPortrait:
		case UIInterfaceOrientationPortraitUpsideDown: 				
			self.countryViewController.view.frame = CGRectMake(0,0,768, 1024 / 2);
			self.stateViewController.view.frame = CGRectMake(0,countryViewController.view.frame.size.height,768/2, 885 / 2);
			self.regionViewController.view.frame = CGRectMake(self.stateViewController.view.frame.size.width, self.stateViewController.view.frame.origin.y, self.stateViewController.view.frame.size.width, self.stateViewController.view.frame.size.height);
			break;
			
		case UIInterfaceOrientationLandscapeLeft:
		case UIInterfaceOrientationLandscapeRight:
			self.countryViewController.view.frame = CGRectMake(0,0,1024, 748 /2 );
			self.stateViewController.view.frame = CGRectMake(0,countryViewController.view.frame.size.height,1024/2, 718 /2 );
			self.regionViewController.view.frame = CGRectMake(self.stateViewController.view.frame.size.width, self.stateViewController.view.frame.origin.y, self.stateViewController.view.frame.size.width, self.stateViewController.view.frame.size.height);
			break;
	}
	
	[self.view addSubview:countryViewController.view];
	[countryViewController loadMap];
	
	[self.view addSubview:regionViewController.view];
	[regionViewController loadMap];
}

-(void)stateSelected:(NSString *)stateSelected
{
	if (stateViewController != nil)
	{
		[stateViewController.view removeFromSuperview];
		[stateViewController release];
		
	}
	
	stateViewController = [[StateViewController alloc] initWithNibName:nil bundle:nil];
	stateViewController.selectedState = stateSelected;
	stateViewController.view.frame = CGRectMake(400,100,0,0);
	[self.view addSubview:stateViewController.view];
	[stateViewController loadMap];
	
	
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:.75];
	[UIView setAnimationDelegate:nil];

	switch ([UIApplication sharedApplication].statusBarOrientation) {
		case UIInterfaceOrientationPortrait:
		case UIInterfaceOrientationPortraitUpsideDown: 					
			self.stateViewController.view.frame = CGRectMake(0,countryViewController.view.frame.size.height,768/2, 885 / 2);
			break;
			
		case UIInterfaceOrientationLandscapeLeft:
		case UIInterfaceOrientationLandscapeRight:
			self.stateViewController.view.frame = CGRectMake(0,countryViewController.view.frame.size.height,1024/2, 718 /2 );
			break;
			
			
	}
	[UIView commitAnimations];
	[stateViewController loadMap];	
}

- (void)viewDidLoad {
    [super viewDidLoad];
		
	self.view.backgroundColor = [UIColor colorWithRed:.8 green:.8 blue:.8 alpha:.9];
	[self loadCountryViewController];
}


- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
	if (countryViewController != nil)
	{
		[countryViewController.view removeFromSuperview];
		[countryViewController release];
	}

	if (stateViewController != nil)
	{
		[stateViewController.view removeFromSuperview];
		[stateViewController release];
	}
	
	if (regionViewController != nil)
	{
		[regionViewController.view removeFromSuperview];
		[regionViewController release];
	}
	
	[self loadCountryViewController];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}


- (void)dealloc {
    [super dealloc];
}

@end
