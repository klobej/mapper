//  Utils.h

#import <Foundation/Foundation.h>

#define HEADER_FOOTER_TABLETYPE_HEADER_KEY @"header"
#define HEADER_FOOTER_TABLETYPE_CONTENT_KEY @"content"
#define HEADER_FOOTER_TABLETYPE_FOOTER_KEY @"footer"
@interface Utils : NSObject {

}

+ (NSString *)pointInsidePolygon:(CGPoint )point withVerticiesDictionary:(NSDictionary *)statesVerticiesDictionary;
+ (UIColor *) colorForHex:(NSString *)hexColor;
+ (UIColor *)colorForValue:(float)value;
+ (UIColor *)colorForState:(NSString *)state;
+ (NSArray *)processWidthsForTwoDimensionalArray:(NSArray *)theArray withFont:(UIFont *)font;
+ (NSString *) stringByStrippingHTML:(NSString *)s;
+ (NSArray *)orderPeriodsByMonth:(NSArray *)periodsArray;
+ (UIColor *)getLightBlueColor;
+ (NSString *)getMonthStringFromShort:(NSString *)shortString;
+ (void)debugLog:(NSString *)logString requestingObject:(id)theObject;
+ (NSArray *)getMonthsKeys;

@end
	