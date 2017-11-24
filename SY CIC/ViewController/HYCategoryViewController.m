//
//  HYCategoryViewController.m
//  SY CIC
//
//  Created by bidiao on 16/2/17.
//  Copyright © 2016年 hybidiao. All rights reserved.
//

#import "HYCategoryViewController.h"
#import "AFNetworking.h"
#import "HYspecies.h"
@interface HYCategoryViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView * tableView;
@property(nonatomic,strong) NSArray * categoryArray;
@property(nonatomic,strong) UIActivityIndicatorView * indicatorView;
@property(nonatomic,strong) UIView * glrayView;
@end
#define HYCATEGROYPATH @"http://www.makeitmobile.com.hk/iForm/index.php/IForm/api/queryReport"
#define  HYSCREENWITH [UIScreen mainScreen].bounds.size.width
#define HYSCREENHIGHT  [UIScreen mainScreen].bounds.size.height
#define HYRemoveCellSeparator \
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{\
cell.separatorInset = UIEdgeInsetsZero;\
cell.layoutMargins = UIEdgeInsetsZero; \
cell.preservesSuperviewLayoutMargins = NO; \
}\

@implementation HYCategoryViewController

-(UITableView *)tableView {
    if (!_tableView) {
        _tableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, HYSCREENWITH, HYSCREENHIGHT) style:UITableViewStylePlain];
    }
    
    return _tableView;
    
}
-(UIActivityIndicatorView *)indicatorView {
    if (!_indicatorView) {
        _indicatorView =[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        _indicatorView.center = self.view.center;
    }
    
    return _indicatorView;
    
}
-(UIView *)glrayView {
    if (!_glrayView) {
        _glrayView =[[UIView alloc]initWithFrame:self.view.frame];
        _glrayView.backgroundColor =[UIColor grayColor];
        _glrayView.alpha=0.1;
    }
    
    return _glrayView;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    self.title = @"報告類別";
    [self setCategoryAFNetworking];
    [self addtableview];
    [self.view addSubview:self.indicatorView];
    [self.view addSubview:self.glrayView];
    [self.indicatorView startAnimating];
    
}
-(void)addtableview{
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    
    
}
-(void)setCategoryAFNetworking{
    
    AFHTTPSessionManager * mgr =[AFHTTPSessionManager manager];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self.indicatorView stopAnimating];
//        [self.glrayView removeFromSuperview];
//    });
    [mgr POST:HYCATEGROYPATH parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        self.categoryArray =[HYspecies parseCategotyJSONfrom:responseObject];
        [self.indicatorView stopAnimating];
        [self.glrayView removeFromSuperview];
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [self.tableView reloadData];
        });
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self.indicatorView stopAnimating];
        [self.glrayView removeFromSuperview];
        
    }];
    
    
    
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.categoryArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * ID = @"MyCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    cell.textLabel.text =self.categoryArray[indexPath.row];
    cell.backgroundColor =[UIColor clearColor];
    tableView.separatorStyle =UITableViewCellSeparatorStyleNone;
    
    [self cellPathLineTableView:tableView newCell:cell index:indexPath];

    return cell;
}
-(void)cellPathLineTableView:(UITableView *)tablview newCell:(UITableViewCell *)cell index:(NSIndexPath *) indexPath {
    tablview.dataSource = self;
    CGFloat folat = [self tableView:tablview heightForRowAtIndexPath:indexPath];
    UIView * viewseparator =[[UIView alloc] initWithFrame:CGRectMake(0, folat, [UIScreen mainScreen].bounds.size.width, 1)];
    viewseparator.backgroundColor =[UIColor blackColor];
    [cell.contentView addSubview:viewseparator];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 40;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [_delegarecategory categoryView:self.categoryArray[indexPath.row]];
    [self.navigationController popViewControllerAnimated:YES];
    
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    cell.separatorInset= UIEdgeInsetsZero;
    cell.layoutMargins = UIEdgeInsetsZero;
    cell.preservesSuperviewLayoutMargins = NO;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
