//
//  HYICCViewController.h
//  SY CIC
//
//  Created by bidiao on 16/2/17.
//  Copyright © 2016年 hybidiao. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HYICCViewControllerDelegate <NSObject>

-(void)iccViewdelegate:(NSString *)iccimage idname:(NSString *)idname;

@end
@interface HYICCViewController : UIViewController
@property(nonatomic,weak) id<HYICCViewControllerDelegate> delegateIcc;
@end
