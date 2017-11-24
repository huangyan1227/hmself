//
//  HYICCViewController.m
//  SY CIC
//
//  Created by bidiao on 16/2/17.
//  Copyright © 2016年 hybidiao. All rights reserved.
//

#import "HYICCViewController.h"
#import "AFNetworking.h"
#import "HYspecies.h"
@interface HYICCViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong) UITableView * tableView;
@property(nonatomic,strong) NSArray * iccArray;
@property(nonatomic,strong) UIView * gralyView;
@property(nonatomic,strong) NSArray * idname;
@property(nonatomic,strong) UIActivityIndicatorView * indicatorView;
@end
#define HYICCPATH @"http://www.makeitmobile.com.hk/iForm/index.php/IForm/api/queryCase"
#define  HYSCREENWITH [UIScreen mainScreen].bounds.size.width
#define HYSCREENHIGHT  [UIScreen mainScreen].bounds.size.height
#define HYRemoveCellSeparator \
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{\
cell.separatorInset = UIEdgeInsetsZero;\
cell.layoutMargins = UIEdgeInsetsZero; \
cell.preservesSuperviewLayoutMargins = NO; \
}\


@implementation HYICCViewController
-(UIActivityIndicatorView *)indicatorView {
    if (!_indicatorView) {
        _indicatorView =[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        _indicatorView.center = self.view.center;
        
    }
    
    return _indicatorView;
    
}
-(UIView *)gralyView {
    if (!_gralyView) {
        _gralyView =[[UIView alloc]initWithFrame:self.view.frame];
        _gralyView.backgroundColor =[UIColor grayColor];
        _gralyView.alpha = 0.1;
    }
    
    return _gralyView;
    
}
-(UITableView *)tableView {
    if (!_tableView) {
        _tableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, HYSCREENWITH, HYSCREENHIGHT) style:UITableViewStylePlain];
    }
    
    return _tableView;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    self.title =@"ICC 號碼";
    [self addtableview];
    [self.view addSubview:self.indicatorView];
    [self.view addSubview:self.gralyView];
    [self.indicatorView startAnimating];
    [self iccANworking];
}
-(void)addtableview{
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    
    
}
-(void)iccANworking{
 
    AFHTTPSessionManager *mgr =[AFHTTPSessionManager manager];
    [mgr POST:HYICCPATH parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        self.iccArray = [HYspecies parseIccJSONfrom:responseObject];
        [self.indicatorView stopAnimating];
        [self.gralyView removeFromSuperview];
       self.idname = [HYspecies parseIccJSONfromNSString:responseObject];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self.indicatorView stopAnimating];
        [self.gralyView removeFromSuperview];
        
    }];
    
    
    
    
}
#pragma mark - TableView DataSource Delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.iccArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString * ID = @"MyCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    
   cell.textLabel.text = self.iccArray[indexPath.row];
    cell.backgroundColor=[UIColor clearColor];
    tableView.separatorStyle= UITableViewCellSelectionStyleNone;
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
HYRemoveCellSeparator
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 40;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [_delegateIcc iccViewdelegate:self.iccArray
     [indexPath.row] idname:self.idname[indexPath.row]];
    [self.navigationController popViewControllerAnimated:YES];
    
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
