//  StatesMarkupManagerObject.m

#import "StatesMarkupManagerObject.h"
#import "CountryViewController.h"
#import "RegionViewController.h"
#import "StateViewController.h"


@interface StatesMarkupManagerObject (PrivateMethods)
-(void)loadOffsetValues;
@end


@implementation StatesMarkupManagerObject

static StatesMarkupManagerObject *sharedManager;

@synthesize statesStringArray, regionsDictionary, statesObjectsDictionary, statesMasterDictionary, statesOffsetDictionary;

-(id)init
{
	self = [super init];
	
	regionsDictionary = [[NSMutableDictionary alloc] initWithCapacity:5];
	
	NSArray *ar = [[NSArray alloc] initWithObjects:@"Hawaii", @"Oregon", @"Idaho", @"Montana", @"Washington", @"Nevada", @"Colorado", @"Wyoming", @"Utah", @"California", @"Arizona", @"NewMexico", nil ];
	[regionsDictionary setObject:ar forKey:@"North West"];
	[ar release];
	
	ar = [[NSArray alloc] initWithObjects:@"NorthDakota", @"SouthDakota", @"Nebraska", @"Oklahoma", @"Kansas", @"Minnesota", @"Texas", @"Iowa", @"Missouri", @"Michigan", @"Wisconsin", @"Illinois", @"Indiana", @"Ohio", @"Kentucky", nil];
	[regionsDictionary setObject:ar forKey:@"Central"];
	[ar release];
	
	ar = [[NSArray alloc] initWithObjects:@"WestVirginia",@"Virginia",@"Maryland", @"DC", @"Pennsylvania",@"Delaware",@"NewJersey",@"NewYork",@"Connecticut",@"RhodeIsland",@"Massachusetts",@"Vermont",@"NewHampshire",@"Maine",nil];
	[regionsDictionary setObject:ar forKey:@"North East"];
	[ar release];
	
	ar = [[NSArray alloc] initWithObjects:@"Arkansas",@"Louisiana",@"Florida",@"Mississippi",@"Alabama",@"Georgia",@"Tennessee",@"SouthCarolina",@"NorthCarolina",nil];
	[regionsDictionary setObject:ar forKey:@"South East"];
	[ar release];
		
	return self;
}

-(void)loadStatesValues
{
	[statesObjectsDictionary removeAllObjects];
}

+ (StatesMarkupManagerObject *)statesMarkupManagerObject
{
	if (sharedManager == nil)
	{
		sharedManager = [[StatesMarkupManagerObject alloc] init];
		[sharedManager loadOffsetValues];
		sharedManager.statesMasterDictionary = [[NSMutableDictionary alloc] init];
		sharedManager.statesObjectsDictionary = [[NSMutableDictionary alloc] init];												 		
		sharedManager.statesStringArray  = [[NSArray arrayWithObjects:@"Montana", @"Idaho", @"Washington", @"NorthDakota", @"DC", @"Minnesota", @"Wisconsin", @"Colorado", @"California", @"Nevada", @"Arizona", @"NewMexico", @"Texas", @"Utah", @"Wyoming", @"SouthDakota", @"Nebraska", @"Kansas", @"Oklahoma",  @"Oregon", @"Louisiana", @"Arkansas", @"Missouri", @"Iowa", @"Illinois", @"Indiana", @"Kentucky", @"Tennessee", @"NorthCarolina", @"Georgia", @"SouthCarolina", @"Alabama", @"Florida", @"Virginia", @"WestVirginia", @"Ohio", @"Mississippi", @"Michigan", @"Maryland", @"Delaware", @"NewJersey", @"NewYork", @"Connecticut", @"RhodeIsland", @"Massachusetts", @"Vermont", @"NewHampshire", @"Maine", @"Michigan", @"Hawaii", @"Pennsylvania",     nil] retain];
		[sharedManager loadStatesValues];
	}
	return sharedManager;
}

-(void)loadMasterStatesDictionary
{	
		
	for (int i = 0; i < [statesStringArray count]; i++)
	{
		
		NSString *filePath = [[NSBundle mainBundle] pathForResource:[statesStringArray objectAtIndex:i] ofType:@"txt"];  
		NSData *myData = [NSData dataWithContentsOfFile:filePath];  	
		if (myData) {  
			
			NSString *content = [[[NSString alloc] initWithData:myData
													   encoding:NSUTF8StringEncoding] autorelease];
			
			NSMutableArray *separatedPointsArray = [NSMutableArray arrayWithCapacity:0];
			
			NSString *pointsString = @"points=\"";
			NSArray *pointsContentArray = [content componentsSeparatedByString:pointsString];
			for (int i = 1; i < [pointsContentArray count]; i++)
			{
				NSString *subContent = [pointsContentArray objectAtIndex:i];							
				subContent = [subContent substringToIndex:[subContent rangeOfString:@"\"/>"].location];
				subContent = [subContent stringByReplacingOccurrencesOfString:@"\n" withString:@""];
				subContent = [subContent stringByReplacingOccurrencesOfString:@"\t" withString:@""];		
				subContent = [subContent stringByReplacingOccurrencesOfString:@"\r" withString:@""];										
				[separatedPointsArray addObject:[subContent componentsSeparatedByString:@" "]];		
			}
			[self.statesMasterDictionary setObject:separatedPointsArray forKey:[statesStringArray objectAtIndex:i]];
		}
	}	
}

-(void)loadOffsetValues
{
	
	
}


@end
