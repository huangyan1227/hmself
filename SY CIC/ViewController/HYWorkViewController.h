//
//  HYWorkViewController.h
//  SY CIC
//
//  Created by bidiao on 16/2/17.
//  Copyright © 2016年 hybidiao. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HYWorkViewControllerDelegate <NSObject>

-(void)workViewName:(NSString*)wakeName;

@end
@interface HYWorkViewController : UIViewController
@property(nonatomic,weak) id<HYWorkViewControllerDelegate> delgegatework;
@end
