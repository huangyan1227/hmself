//
//  HYWorkViewController.m
//  SY CIC
//
//  Created by bidiao on 16/2/17.
//  Copyright © 2016年 hybidiao. All rights reserved.
//

#import "HYWorkViewController.h"
#import "AFNetworking.h"
#import "HYspecies.h"

@interface HYWorkViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong) UITableView * tableView;
@property(nonatomic,strong) NSArray * workarray;
@property(nonatomic,strong) UIActivityIndicatorView * indicatorView;
@property(nonatomic,strong) UIView * graryView;
@end
#define HYWORKPATH @"http://www.makeitmobile.com.hk/iForm/index.php/IForm/api/queryOther"
#define  HYSCREENWITH [UIScreen mainScreen].bounds.size.width
#define HYSCREENHIGHT  [UIScreen mainScreen].bounds.size.height
@implementation HYWorkViewController
-(UIActivityIndicatorView *)indicatorView {
    if (!_indicatorView) {
        _indicatorView=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        _indicatorView.center = self.view.center;
    }
    
    return _indicatorView;
    
}
-(UIView *)graryView {
    if (!_graryView) {
        _graryView =[[UIView alloc]initWithFrame:self.view.frame];
        _graryView.backgroundColor =[UIColor grayColor];
        _graryView.alpha = 0.1;
    }
    
    return _graryView;
    
}
-(UITableView *)tableView {
    if (!_tableView) {
        _tableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, HYSCREENWITH, HYSCREENHIGHT) style:UITableViewStylePlain];
    }
    
    return _tableView;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setWorkAFNetworking];
    self.view.backgroundColor =[UIColor whiteColor];
     self.title = @"工作情況";
    [self addtableview];
    [self.view addSubview:self.indicatorView];
    [self.view addSubview:self.graryView];
    [self.indicatorView startAnimating];
}
-(void)addtableview{
    self.tableView.dataSource = self;
    self.tableView.delegate =self;
    [self.view addSubview:self.tableView];
    
}
-(void)setWorkAFNetworking{
    
    AFHTTPSessionManager * mgr =[AFHTTPSessionManager manager];
    [mgr POST:HYWORKPATH parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        self.workarray =[HYspecies parseWorkJSONfrom:responseObject];
        [self.indicatorView stopAnimating];
        [self.graryView removeFromSuperview];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self.indicatorView stopAnimating];
        [self.graryView removeFromSuperview];
        
    }];
    
    
    
    
    
    
}
#pragma mark - DataSource Delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.workarray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * ID = @"MyCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    
     cell.textLabel.text =self.workarray[indexPath.row];
    cell.textLabel.numberOfLines =0;
    cell.backgroundColor =[UIColor clearColor];
    tableView.separatorStyle= UITableViewCellSeparatorStyleNone;
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
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    cell.separatorInset = UIEdgeInsetsZero;
    cell.layoutMargins = UIEdgeInsetsZero;
    cell.preservesSuperviewLayoutMargins=NO;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [_delgegatework workViewName:self.workarray[indexPath.row]];
    [self.navigationController popViewControllerAnimated:YES];
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
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
