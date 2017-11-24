//
//  Constants.h
//  hy
//
//  Created by bidiao on 15/11/23.
//  Copyright © 2015年 bidiao. All rights reserved.
//

#ifndef Constants_h
#define Constants_h
#define  HYSCREENWITH [UIScreen mainScreen].bounds.size.width
#define HYSCREENHIGHT  [UIScreen mainScreen].bounds.size.height

#define HYColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
//随机色
#define HYColorRGB(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]

#define HYRandomColor [UIColor colorWithRed:(arc4random_uniform(256))/255.0 green:(arc4random_uniform(256))/255.0 blue:(arc4random_uniform(256))/255.0 alpha:1.0]
//#define  HYSCREENX 3
//#define  HYSCREENY 3
//#define  HYCELLNH 60
//#define  HYTableRow 14
//#define  HYThree 30
//#define  HYTwo   20
//#define  HYTen  10
#define HYTime 90.0
CGFloat const HYSCREENX =3;
CGFloat const HYSixTen =60;
CGFloat const HYSCREENY =3;
CGFloat const HYTableRow =14;
CGFloat const HYThree =30;
CGFloat const HYTwo  =  20;
CGFloat const HYTen  =  10;
CGFloat const HYFour = 40;
CGFloat const HYFIFITen =15;
CGFloat const HYEIGHTTen = 80;
#define HYSAYPsth @"http://www.makeitmobile.com.hk/safe/index.php/IForm/Api/querySafe"
#define HYNETworkPAth  @"http://www.makeitmobile.com.hk/iForm/index.php/IForm/api/doPost"
//移除iOS7之后，cell默认左侧的分割线边距
#define HYRemoveCellSeparator \
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{\
cell.separatorInset = UIEdgeInsetsZero;\
cell.layoutMargins = UIEdgeInsetsZero; \
cell.preservesSuperviewLayoutMargins = NO; \
}\

//Docment文件夹目录
#define kDocumentPath NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject



#endif /* Constants_h */
