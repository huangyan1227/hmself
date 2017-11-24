//
//  HYSucessViewController.m
//  SY CIC
//
//  Created by bidiao on 16/2/17.
//  Copyright © 2016年 hybidiao. All rights reserved.
#import "HYSucessViewController.h"

@interface HYSucessViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView * tablview;
@property(nonatomic,strong) NSMutableArray * mutableArray;
@end
#define HYDOCOMpath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]stringByAppendingPathComponent:@"Sucessy.plist"]
@implementation HYSucessViewController
-(UITableView *)tablview {
    if (!_tablview) {
        _tablview =[[UITableView alloc]initWithFrame:self.view.frame];
    }
    
    return _tablview;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self fonuTableView];
    self.mutableArray = [NSMutableArray array];
    
    [self removeBatbutton];
    [self pataSucess];
    
}
-(void)removeBatbutton{
    UIBarButtonItem * rigatItem =[[UIBarButtonItem alloc]initWithTitle:@"删除所有" style:UIBarButtonItemStylePlain target:self action:@selector(clcikfremove)];
    rigatItem.tintColor =[UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = rigatItem;
    
}
-(void)clcikfremove{
    NSFileManager * fileManager =[NSFileManager defaultManager];
    [fileManager removeItemAtPath:HYDOCOMpath error:nil];
    
    self.mutableArray = nil;
    [self.tablview removeFromSuperview];
    [self.tablview reloadData];
    
    
}
-(void)fonuTableView{
    self.view.backgroundColor =[UIColor whiteColor];
    self.tablview.delegate = self;
    self.tablview.dataSource = self;
    [self.view addSubview:self.tablview];
}
-(void)pataSucess{
    for (int i =(int)self.array.count -1; i>-1; i--                                                                                                                                                                      ) {
        [self.mutableArray addObject:self.array[i]];
    }
    NSArray * arrar =[NSArray arrayWithContentsOfFile:HYDOCOMpath];
    if (arrar.count !=0) {
        [self.mutableArray addObjectsFromArray:arrar];
    }
    [self.mutableArray writeToFile:HYDOCOMpath atomically:YES];
    
}

#pragma mark - TableView Delegate DataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.mutableArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * ID = @"MyCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    
    cell.textLabel.text =self.mutableArray[indexPath.row];
    cell.textLabel.numberOfLines = 0;
    tableView.separatorStyle= UITableViewCellSeparatorStyleNone;
    tableView.dataSource = self;
    
    cell.selected = UITableViewCellAccessoryNone;
    tableView.allowsSelection = NO;
    [self celllview:cell];
    
    return cell;

}
-(void)celllview:(UITableViewCell *)cell{
    
    UIView * viewseparator =[[UIView alloc]initWithFrame:CGRectMake(0, cell.frame.size.height-2, [UIScreen mainScreen].bounds.size.width, 1)];
    viewseparator.backgroundColor =[UIColor blackColor];
    [cell.contentView addSubview:viewseparator];
    
    
    
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return YES;
}
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return UITableViewCellEditingStyleDelete;
    

}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle ==UITableViewCellEditingStyleDelete) {
        [self.mutableArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        [self.mutableArray writeToFile:NSHyphenationFactorDocumentAttribute atomically:YES];
    }
    
    
    
}
-(NSString*)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"删除";
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
