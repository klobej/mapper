
//  Utils.m

#import "Utils.h"
#import "StatesMarkupManagerObject.h"
@implementation Utils



+(NSString *)pointInsidePolygon:(CGPoint )point withVerticiesDictionary:(NSDictionary *)statesVerticiesDictionary
{
	NSString *ret = nil;
	int h = 0; 
	BOOL found = NO;
	NSArray *keys = [statesVerticiesDictionary allKeys];
	while (!found && h < [statesVerticiesDictionary count])
	{
		NSString *key = [keys objectAtIndex:h];
		NSArray *vertiticesArray = [statesVerticiesDictionary objectForKey:key];
		
		NSMutableArray *polyX = [NSMutableArray arrayWithCapacity:[vertiticesArray count]];
		for (int z = 0; z < [vertiticesArray count]; z++)
			[polyX addObject:[NSNumber numberWithFloat:[[vertiticesArray objectAtIndex:z] CGPointValue].x]];
		
		NSMutableArray *polyY = [NSMutableArray arrayWithCapacity:[vertiticesArray count]];
		for (int z = 0; z < [vertiticesArray count]; z++)
			[polyY addObject:[NSNumber numberWithFloat:[[vertiticesArray objectAtIndex:z] CGPointValue].y]];
		
		int polySides = [vertiticesArray count];
		
		int  j=polySides-1 ;
		BOOL  oddNodes=NO;
		
		for (int i=0; i<polySides; i++) {
			if ([[polyY objectAtIndex:i] floatValue] <point.y && [[polyY objectAtIndex:j] floatValue]>=point.y ||  [[polyY objectAtIndex:j] floatValue]<point.y && [[polyY objectAtIndex:i] floatValue]>=point.y) 
			{				
				if ([[polyX objectAtIndex:i] floatValue]+(point.y-[[polyY objectAtIndex:i] floatValue])/([[polyY objectAtIndex:j] floatValue]-[[polyY objectAtIndex:i] floatValue])*([[polyX objectAtIndex:j] floatValue]-[[polyX objectAtIndex:i] floatValue])<point.x) 
				{
					
					
					oddNodes=!oddNodes; 
				}
			}
			j=i; 
		}
		h++;
		
		if (oddNodes)
		{
			found = YES;
			ret = key;
		}
		
	}
	if (ret != nil)
		ret = [ret substringToIndex:[ret rangeOfString:@"_"].location];
	
	return ret;
}


+ (UIColor *) colorForHex:(NSString *)hexColor {
	hexColor = [[hexColor stringByTrimmingCharactersInSet:
				 [NSCharacterSet whitespaceAndNewlineCharacterSet]
				 ] uppercaseString];  
	
    if ([hexColor length] < 6) 
		return [UIColor blackColor];  

    if ([hexColor hasPrefix:@"#"]) 
		hexColor = [hexColor substringFromIndex:1];  
	
    if ([hexColor length] != 6)
		return [UIColor blackColor];  
	
    NSRange range;  
    range.location = 0;  
    range.length = 2; 
	
    NSString *rString = [hexColor substringWithRange:range];  
	
    range.location = 2;  
    NSString *gString = [hexColor substringWithRange:range];  
	
    range.location = 4;  
    NSString *bString = [hexColor substringWithRange:range];  
	
    // Scan values  
    unsigned int r, g, b;  
    [[NSScanner scannerWithString:rString] scanHexInt:&r];  
    [[NSScanner scannerWithString:gString] scanHexInt:&g];  
    [[NSScanner scannerWithString:bString] scanHexInt:&b];  
	
    return [UIColor colorWithRed:((float) r / 255.0f)  
                           green:((float) g / 255.0f)  
                            blue:((float) b / 255.0f)  
                           alpha:1.0f];  
	
}


+ (UIColor *)colorForValue:(float)floatNum
{
	
	if (floatNum < -.8)
	{
		return [UIColor colorWithRed:97/255.0f green:75/255.0f blue:102/255.0f alpha:1];
	}
	else if (floatNum < -.6)
	{
		return [UIColor colorWithRed:106/255.0f green:80/255.0f blue:110/255.0f alpha:1];
	}
	else if (floatNum < -.4)
	{
		return [UIColor colorWithRed:128/255.0f green:112/255.0f blue:132/255.0f alpha:1];
	}
	else if (floatNum < -.2)
	{
		return [UIColor colorWithRed:147/255.0f green:133/255.0f blue:151/255.0f alpha:1];
	}
	else if (floatNum < 0)
	{
		return [UIColor colorWithRed:172/255.0f green:158/255.0f blue:177/255.0f alpha:1];
	}
	else if (floatNum > .8)
	{
		return [UIColor colorWithRed:85/255.0f green:94/255.0f blue:73/255.0f alpha:1];
	}
	else if (floatNum > .6)
	{
		return [UIColor colorWithRed:100/255.0f green:107/255.0f blue:93/255.0f alpha:1];
	}
	else if (floatNum > .4)
	{
		return [UIColor colorWithRed:123/255.0f green:130/255.0f blue:121/255.0f alpha:1];
	}
	else if (floatNum > .2)
	{
		return [UIColor colorWithRed:156/255.0f green:160/255.0f blue:156/255.0f alpha:1];
	}
	else if (floatNum > 0)
	{
		return [UIColor colorWithRed:164/255.0f green:168/255.0f blue:164/255.0f alpha:1];
	}
	else {
		return [UIColor colorWithRed:150/255.0f green:156/255.0f blue:170/255.0f alpha:1];
	}
	
	
	
	
	
}

+ (NSArray *)processWidthsForTwoDimensionalArray:(NSArray *)theArray withFont:(UIFont *)font
{
	
	NSMutableArray *returnValuesArray = [NSMutableArray arrayWithCapacity:0];
	[returnValuesArray addObject:[NSNumber numberWithFloat:0]];

	for (int i = 0; i < [theArray count]; i++)
		for (int j = 0; j < [[theArray objectAtIndex:i] count]; j++)		
		{
			NSArray *ar = [[theArray objectAtIndex:i] objectAtIndex:j];

			for (int k = 0; k < [ar count]; k++)
			{
				if (k > ([returnValuesArray count] - 1))
					[returnValuesArray addObject:[NSNumber numberWithFloat:0]];

				id obj = [ar objectAtIndex:k];
				if ([obj isKindOfClass:[NSNumber class]])
					obj = [NSString stringWithFormat:@"%@", obj];
				
				if ([obj sizeWithFont:font].width > [[returnValuesArray objectAtIndex:k] floatValue])
					[returnValuesArray replaceObjectAtIndex:k withObject:[NSNumber numberWithFloat:[obj sizeWithFont:font].width]];
			}
			
		}
	return returnValuesArray;
}

+(NSString *)stripParentheses:(NSString *)theString
{

	theString = [theString stringByReplacingOccurrencesOfString:@"(" withString:@""];
	theString = [theString stringByReplacingOccurrencesOfString:@")" withString:@""];	
	return theString;
	
}
+(NSString *) stringByStrippingHTML:(NSString *)s {
	NSRange r;
	while ((r = [s rangeOfString:@"<[^>]+>" options:NSRegularExpressionSearch]).location != NSNotFound)
		s = [s stringByReplacingCharactersInRange:r withString:@""];
	return s; 
}

+(NSString *)getMonthStringFromShort:(NSString *)shortString
{
	shortString = [Utils stripParentheses:shortString];
	NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:@"January", @"jan", @"February", @"feb", @"March", @"mar", @"April", @"apr", @"May", @"may", @"June", @"jun", @"July", @"jul",  @"August", @"aug", @"September", @"sep", @"October", @"oct", @"November", @"nov", @"December", @"dec", nil ];

	return [dict objectForKey:[shortString lowercaseString]];
}

+ (NSArray *)getMonthsKeys
{
	NSMutableArray *orderArray = [NSMutableArray arrayWithObjects:@"Jan", @"Feb", @"Mar", @"Apr", @"May", @"Jun", @"Jul", @"Aug", @"Sep", @"Oct", @"Nov", @"Dec", nil];
	for (int i = 0; i < [orderArray count]; i++)
		[orderArray replaceObjectAtIndex:i withObject:[NSString stringWithFormat:@"(%@)", [orderArray objectAtIndex:i]]];
		 
	return orderArray;
	
}

+ (NSArray *)orderPeriodsByMonth:(NSArray *)periodsArray
{
	NSMutableArray *orderArray = [NSMutableArray arrayWithObjects:@"Jan", @"Feb", @"Mar", @"Apr", @"May", @"Jun", @"Jul", @"Aug", @"Sep", @"Oct", @"Nov", @"Dec", nil];
	for (int i = 0; i < [orderArray count]; i++)
	{
		[orderArray replaceObjectAtIndex:i withObject:[NSString stringWithFormat:@"(%@)", [orderArray objectAtIndex:i]]];
	}
	NSMutableArray *retAr = [NSMutableArray arrayWithCapacity:0];
	
	
	for (int i = 0; i < [orderArray count]; i++)
	{
		for (int j = 0; j < [periodsArray count]; j++)
			if ([(NSString *)[(NSString *)[periodsArray objectAtIndex:j] lowercaseString] compare:[[orderArray objectAtIndex:i] lowercaseString]] == NSOrderedSame)
				[retAr addObject:[periodsArray objectAtIndex:j]];
	}
			
	return retAr;
}

+ (UIColor *)getLightBlueColor
{
	return [UIColor colorWithRed:102 / 255.0f 
						   green:116 / 255.0f
							blue:130 / 255.0f
						   alpha:1];  	
}

@end
