//
//  HYspecies.h
//  SY CIC
//
//  Created by bidiao on 16/2/18.
//  Copyright © 2016年 hybidiao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HYspecies : NSObject
+(NSArray *)parseJSONfrom:(NSArray *)array;
+(NSArray *)parseCategotyJSONfrom:(NSArray *)array;
+(NSArray *)parseWorkJSONfrom:(NSArray *)array;
+(NSArray *)parseIccJSONfrom:(NSArray *)array;
+(NSArray*)parseIccJSONfromNSString:(NSArray*)array;
@end
