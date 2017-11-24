//
//  HYSpeciesViewController.m
//  SY CIC
//
//  Created by bidiao on 16/2/17.
//  Copyright © 2016年 hybidiao. All rights reserved.
//

#import "HYSpeciesViewController.h"
#import "HYspecies.h"
#import "AFNetworking.h"
@interface HYSpeciesViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView * tableView;
@property(nonatomic,strong) NSArray * arrayName;
@property(nonatomic,strong) UIView * glaryView;
@property(nonatomic,strong) UIActivityIndicatorView * indicatorView;
@end
#define HYSPECIESPARH @"http://www.makeitmobile.com.hk/iForm/index.php/IForm/api/queryType"
#define  HYSCREENWITH [UIScreen mainScreen].bounds.size.width
#define HYSCREENHIGHT  [UIScreen mainScreen].bounds.size.height
#define HYRemoveCellSeparator \
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{\
cell.separatorInset = UIEdgeInsetsZero;\
cell.layoutMargins = UIEdgeInsetsZero; \
cell.preservesSuperviewLayoutMargins = NO; \
}\

@implementation HYSpeciesViewController
-(UITableView *)tableView {
    if (!_tableView) {
        _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, HYSCREENWITH, HYSCREENHIGHT) style:UITableViewStylePlain];
    }
    
    return _tableView;
    
}
-(UIActivityIndicatorView *)indicatorView {
    if (!_indicatorView) {
        _indicatorView =[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        _indicatorView.center =self.view.center;
    }
    
    return _indicatorView;
    
}
-(UIView *)glaryView {
    if (!_glaryView) {
        _glaryView =[[UIView alloc]initWithFrame:self.view.frame];
        _glaryView.alpha = 0.1;
        _glaryView.backgroundColor =[UIColor grayColor];
    }
    
    return _glaryView;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor =[UIColor whiteColor];
    self.title = @"種   類";
  
    [self addtablview];
    [self.view addSubview:self.indicatorView];
    [self.view addSubview:self.glaryView];
    [self.indicatorView startAnimating];
    [self setNotework];
    
    
    }
-(void)addtablview{
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
   
}

-(void)setNotework{
   
    
    AFHTTPSessionManager * mgr =[AFHTTPSessionManager manager];
    [mgr POST:HYSPECIESPARH parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        self.arrayName =[HYspecies parseJSONfrom:responseObject];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.indicatorView stopAnimating];
            [self.glaryView removeFromSuperview];
            [self.tableView reloadData];
        });

        
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self.indicatorView stopAnimating];
        [self.glaryView removeFromSuperview];
        
    }];
    
            
           }
#pragma marke - TableView DataSource Delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrayName.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * ID = @"MyCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    
   cell.textLabel.text =self.arrayName[indexPath.row];
   // cell.backgroundColor =[UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self cellPathLineTableView:tableView newCell:cell index:indexPath];
//
    return cell;

}
#pragma mark - 画线
-(void)cellPathLineTableView:(UITableView *)tablview newCell:(UITableViewCell *)cell index:(NSIndexPath *) indexPath {
    tablview.dataSource = self;
    CGFloat folat = [self tableView:tablview heightForRowAtIndexPath:indexPath];
    UIView * viewseparator =[[UIView alloc] initWithFrame:CGRectMake(0, folat-2, [UIScreen mainScreen].bounds.size.width, 1)];
    viewseparator.backgroundColor =[UIColor blackColor];
    [cell.contentView addSubview:viewseparator];
}
HYRemoveCellSeparator
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [_delegatespecies speciesView:self.arrayName[indexPath.row]];
    [self.navigationController popViewControllerAnimated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 40;
    
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
