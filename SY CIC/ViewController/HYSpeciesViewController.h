//
//  HYSpeciesViewController.h
//  SY CIC
//
//  Created by bidiao on 16/2/17.
//  Copyright © 2016年 hybidiao. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HYSpeciesViewControllerDelegate <NSObject>

-(void)speciesView:(NSString*)speciesName;

@end
@interface HYSpeciesViewController : UIViewController
@property(nonatomic,weak) id<HYSpeciesViewControllerDelegate>delegatespecies;
@end
