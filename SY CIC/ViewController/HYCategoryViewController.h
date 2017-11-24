//
//  HYCategoryViewController.h
//  SY CIC
//
//  Created by bidiao on 16/2/17.
//  Copyright © 2016年 hybidiao. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HYCategoryViewControllerDelegate <NSObject>

-(void)categoryView:(NSString*)categoryName;

@end
@interface HYCategoryViewController : UIViewController
@property(nonatomic,weak) id<HYCategoryViewControllerDelegate> delegarecategory;
@end
