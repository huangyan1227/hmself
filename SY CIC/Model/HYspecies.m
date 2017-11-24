//
//  HYspecies.m
//  SY CIC
//
//  Created by bidiao on 16/2/18.
//  Copyright © 2016年 hybidiao. All rights reserved.
//

#import "HYspecies.h"

@implementation HYspecies
+(NSArray *)parseJSONfrom:(NSArray *)array{
    
    NSMutableArray * mutableArray =[NSMutableArray array];
    
    for (int i =0; i<array.count; i++) {
        NSString * names =array[i][@"cType"];
        [mutableArray addObject:names];
    }
    
    return [mutableArray copy];
}
+(NSArray *)parseCategotyJSONfrom:(NSArray *)array{
    
    NSMutableArray * mutableArray =[NSMutableArray array];
    
    for (int i =0; i<array.count; i++) {
        NSString * names =array[i][@"name"];
       
        [mutableArray addObject:names];
    }
    
    return [mutableArray copy];
}
+(NSArray *)parseWorkJSONfrom:(NSArray *)array{
    NSMutableArray * mutableArray =[NSMutableArray array];
    
    for (int i =0; i<array.count; i++) {
        NSString * names =array[i][@"name"];
        [mutableArray addObject:names];
    }
    
    return [mutableArray copy];
    
}
+(NSArray *)parseIccJSONfrom:(NSArray *)array{
    
    
    NSMutableArray * mutable =[NSMutableArray array];
    for (int i=0; i<array.count; i++) {
        NSString * name = array[i][@"name"];
        NSString *remarname =array[i][@"remark"];
        NSString *addername = array[i][@"addr"];
        name =[name stringByAppendingString: [NSString stringWithFormat:@"  %@",remarname]];
        name =[name stringByAppendingString:[NSString stringWithFormat:@"   %@",addername]];
       
        [mutable addObject:name];
    }
    return [mutable copy];
    
}
+(NSArray *)parseIccJSONfromNSString:(NSArray*)array{
    
    NSMutableArray * name=[NSMutableArray array];
       for (int i=0; i<array.count; i++) {
        NSString * nemeString = array[i][@"id"];
           [name addObject:nemeString];
           
             }
    return [name copy];

}
@end
