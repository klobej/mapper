//  MapperAppDelegate.m

#import "MapperAppDelegate.h"
#import "MapperViewController.h"
#import "StatesMarkupManagerObject.h"
@implementation MapperAppDelegate

@synthesize window;
@synthesize viewController;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
	[[StatesMarkupManagerObject statesMarkupManagerObject] loadMasterStatesDictionary];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];

	return YES;
}

- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
