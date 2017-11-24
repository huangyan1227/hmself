//
//  HYMainViewController.m
//  SY CIC
//
//  Created by bidiao on 16/2/16.
//  Copyright © 2016年 hybidiao. All rights reserved.
//

#import "HYMainViewController.h"
#import "Constants.h"
#import "HYTextView.h"
#import "HYICCViewController.h"
#import "HYSpeciesViewController.h"
#import "HYCategoryViewController.h"
#import "HYSucessViewController.h"
#import "HYWorkViewController.h"
#import "UWDatePickerView.h"
#import "ZLPhoto.h"
#import "IQKeyboardManager.h"
//#import "AFNetworking.h"
#import "TSMessage.h"
#import "YYAnimationIndicator.h"
@interface HYMainViewController ()<UITableViewDelegate,UITableViewDataSource,UWDatePickerViewDelegate,HYSpeciesViewControllerDelegate,HYCategoryViewControllerDelegate,HYWorkViewControllerDelegate,HYICCViewControllerDelegate>
{
    UWDatePickerView *_pickerView;
    int _ine;
}
void UIImageWriteToSavedPhotosAlbum (
                                     UIImage  * image,
                                     id      completionTarget,
                                     SEL      completionSelector,
                                     void    *contextInfo
                                     );

@property(nonatomic,strong) UILabel * iccShowlable;
@property(nonatomic,strong) UILabel * specieslable;
@property(nonatomic,strong) UILabel * categorlabe;
@property(nonatomic,strong) UILabel * worklabe;
@property(nonatomic,strong) UILabel * timelable;
@property(nonatomic,strong) UILabel * figurelable;
@property(nonatomic,strong) UILabel * completelable;
@property(nonatomic,strong) HYTextView * noteTextview;
@property(nonatomic,strong) HYTextView * maintenanceTextview;
@property(nonatomic,strong) UIButton * tufenYesbutton;
@property(nonatomic,strong) UIButton * tufenNobutton;
@property(nonatomic,strong) UIButton * maintenanceYesbutton;
@property(nonatomic,strong) UIButton * maintenanceNobutton;
@property(nonatomic,strong) UIButton * arrangeYewbutton;
@property(nonatomic,strong) UIButton * arrangeNobutton;
@property(nonatomic,copy) NSString * timeString;
@property(nonatomic,assign) float  a;
@property(nonatomic,strong) UITableView * tablview;
@property(nonatomic,strong) NSMutableArray * arrayPhone;
@property(nonatomic,strong) YYAnimationIndicator * indicator;
@property(nonatomic,strong) NSMutableArray * sucessArray;
@property(nonatomic,strong) NSString * idname;
@end
@implementation HYMainViewController
-(UIButton *)arrangeNobutton {
    if (!_arrangeNobutton) {
        _arrangeNobutton =[[UIButton alloc]init];
    }
    return _arrangeNobutton;
}
-(UIButton *)arrangeYewbutton {
    if (!_arrangeYewbutton) {
        _arrangeYewbutton =[[UIButton alloc]init];
    }
    return _arrangeYewbutton;
}
-(UIButton *)maintenanceYesbutton {
    if (!_maintenanceYesbutton) {
        _maintenanceYesbutton =[[UIButton alloc]init];
    }
    return _maintenanceYesbutton;
}
-(UIButton *)maintenanceNobutton {
    if (!_maintenanceNobutton) {
        _maintenanceNobutton =[[UIButton alloc]init];
    }
    return _maintenanceNobutton;
}
-(UIButton *)tufenNobutton {
    if (!_tufenNobutton) {
        _tufenNobutton =[[UIButton alloc]init];
    }
    return _tufenNobutton;
}
-(UIButton *)tufenYesbutton {
    if (!_tufenYesbutton) {
        _tufenYesbutton =[[UIButton alloc]init];
    }
    return _tufenYesbutton;
}
-(UILabel *)iccShowlable {
    if (!_iccShowlable) {
        _iccShowlable =[[UILabel alloc]init];
    }
    return _iccShowlable;
}
-(UILabel *)specieslable {
    if (!_specieslable) {
        _specieslable =[[UILabel alloc]init];
    }
    return _specieslable;
}
-(UILabel *)categorlabe {
    if (!_categorlabe) {
        _categorlabe =[[UILabel alloc]init];
    }
    return _categorlabe;
}
-(UILabel *)worklabe {
    if (!_worklabe) {
        _worklabe =[[UILabel alloc]init];
    }
    return _worklabe;
}
-(UILabel *)timelable {
    if (!_timelable) {
        _timelable =[[UILabel alloc]init];
    }
    return _timelable;
}
-(UILabel *)figurelable {
    if (!_figurelable) {
        _figurelable =[[UILabel alloc]init];
    }
    return _figurelable;
}
-(UILabel *)completelable {
    if (!_completelable) {
        _completelable = [[UILabel alloc]init];
    }
    return _completelable;
}
-(HYTextView *)noteTextview {
    if (!_noteTextview) {
        _noteTextview =[[HYTextView alloc]init];
        _noteTextview.placehoder = @" 請輸入影響因素";
    }
    return _noteTextview;
}
-(HYTextView *)maintenanceTextview {
    if (!_maintenanceTextview) {
        _maintenanceTextview =[[HYTextView alloc]init];
        _maintenanceTextview.placehoder = @" 维修准备";
       // _noteTextview.backgroundColor = [UIColor clearColor];
    }
    return _maintenanceTextview;
}
-(YYAnimationIndicator *)indicator {
    if (!_indicator) {
        _indicator=[[YYAnimationIndicator alloc]initWithFrame:CGRectMake(self.view.center.x, self.view.center.y, 100, HYEIGHTTen)];
    }
    
    return _indicator;
    
}
-(NSMutableArray *)sucessArray {
    if (!_sucessArray) {
        _sucessArray =[NSMutableArray array];
    }
    
    return _sucessArray;
    
}
-(NSMutableArray *)arrayPhone {
    if (!_arrayPhone) {
        _arrayPhone =[NSMutableArray array];
    }
    
    return _arrayPhone;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self updow];
    _ine = 0;

}
-(void)updow{
    [self.indicator setLoadText:@"正在上传中........."];
    [self.view addSubview:self.indicator];
    
}
#pragma mark- UITableView Data Delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 13;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * ID = @"MyCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }else{
        //删除cell的所有子视图
        while ([cell.contentView.subviews lastObject] != nil)
        {
            [(UIView*)[cell.contentView.subviews lastObject] removeFromSuperview];
        }
        
    }
    switch (indexPath.row) {
        case 0:
            [self celllabelefirst:@"    ICC 號碼" cellconview:cell
             selebutton:@"選擇" intext:indexPath showlable:self.iccShowlable];
                break;
          case 1:
    [self celllabelefirst:@"    種    類" cellconview:cell selebutton:@"選擇" intext:indexPath showlable:self.specieslable];
            break;
            case 2:
            [self celllabelefirst:@"    報告類別" cellconview:cell selebutton:@"選擇" intext:indexPath showlable:self.categorlabe];
            break;
            case 3:
            [self celllabelefirst:@"    工作情況" cellconview:cell selebutton:@"選擇" intext:indexPath showlable:self.worklabe];
         
            break;
            case 4:
            [self celllabelefirst:@"    日期時間" cellconview:cell selebutton:@"日期" intext:indexPath showlable:self.timelable];
            break;
            case 5:
            [self celllabelefirst:@"    現場照片" cellconview:cell selebutton:@"照片" intext:indexPath showlable:nil];
            break;
            case 6:
            [self textlable:@"   附加觀察備註(受天氣影響?需與商鋪協商?受車輛阻礙?)"celllable:cell textView: self.noteTextview];
            break;
            case 7:
            [self celllabelefirst:@"  圖封(如有)" cellconview:cell selebutton:nil intext:indexPath showlable:nil];
            [self yeslableButton:self.tufenYesbutton nobutton:self.tufenNobutton cellconView:cell];
            break;
            case 8:
            [self celllabelefirst:@"  圖封日期時間" cellconview:cell  selebutton:@"日期" intext:indexPath showlable:self.figurelable];
            break;
            case 9:
            [self celllabelefirst:@"  维修完成" cellconview:cell selebutton:nil intext:indexPath showlable:nil];
            [self yeslableButton:self.maintenanceYesbutton nobutton:self.maintenanceNobutton cellconView:cell];
            break;
            case 10:
            [self celllabelefirst:@"  维修完成日期時間" cellconview:cell selebutton:@"日期" intext:indexPath showlable:self.completelable];
            break;
            case 11:
            [self celllabelefirst:@"  维修工作正在安排中" cellconview:cell selebutton:nil intext:indexPath showlable:nil];
            [self yeslableButton:self.arrangeYewbutton nobutton:self.arrangeNobutton cellconView:cell];
            break;
            case 12:
            [self textlable:@"   維修工作安排" celllable:cell textView:self.maintenanceTextview];
            break;
        default:
            break;
    }
    self.tablview = tableView;
    tableView.contentInset = UIEdgeInsetsZero;
    tableView.showsVerticalScrollIndicator = NO;
     cell.backgroundColor = [UIColor clearColor];
    tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    [self cellPathLineTableView:tableView newCell:cell index:indexPath];
    return cell;
}
#pragma mark - 画线
-(void)cellPathLineTableView:(UITableView *)tablview newCell:(UITableViewCell *)cell index:(NSIndexPath *) indexPath {
    tablview.dataSource = self;
    CGFloat folat = [self tableView:tablview heightForRowAtIndexPath:indexPath];
    UIView * viewseparator =[[UIView alloc] initWithFrame:CGRectMake(0, folat, [UIScreen mainScreen].bounds.size.width, 1)];
    viewseparator.backgroundColor =[UIColor blackColor];
    [cell.contentView addSubview:viewseparator];
}
HYRemoveCellSeparator
#pragma mark - 高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 6 || indexPath.row ==12) {
        return 140;
    }else{
        return HYEIGHTTen;
    }
}
#pragma mark - 第一个Lable 和 button
-(void)celllabelefirst:(NSString *)title cellconview:(UITableViewCell *)cell selebutton:(NSString*)buttontitle intext:(NSIndexPath *)indexPath showlable:(UILabel*)lable{
    UILabel * firstlable =[[UILabel alloc]init];
    firstlable.frame = CGRectMake(HYTen, HYTen, HYSCREENWITH -150, 25);
    firstlable.text = title;
    firstlable.numberOfLines = 0;
    [cell.contentView addSubview:firstlable];
    lable.frame = CGRectMake(HYTen, HYFour, HYSCREENWITH -HYFIFITen, 35);
   
    [lable setFont:[UIFont systemFontOfSize:14]];
    lable.numberOfLines =0;
    [cell.contentView addSubview:lable];
    if (indexPath.row ==7 || indexPath.row ==9 || indexPath.row ==11) {
       
    }else{
        UIButton *  button =[[UIButton alloc]init];
        [button setTitle:buttontitle forState:UIControlStateNormal];
        button.frame = CGRectMake(HYSCREENWITH - HYEIGHTTen -HYTen, 5, HYEIGHTTen, HYThree);
        [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
       button.backgroundColor =[UIColor grayColor];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.tag =indexPath.row;
    [cell.contentView addSubview:button];
    }

}
-(void)click:(UIButton *)button{
    switch (button.tag) {
        case 0:{
            HYICCViewController *icc =[[HYICCViewController alloc]init];
            icc.delegateIcc =self;  [self.navigationController pushViewController:icc animated:YES];}
            break;
        case 1:{
            HYSpeciesViewController *p =[[HYSpeciesViewController alloc]init];
            p.delegatespecies = self;
            [self.navigationController pushViewController:p animated:YES];
        }
            break;
        case 2:{HYCategoryViewController * category =[[HYCategoryViewController alloc]init];category.delegarecategory = self;
            [self.navigationController pushViewController:category animated:YES];}
            break;
        case 3:{HYWorkViewController * workView =[HYWorkViewController new];workView.delgegatework =self;
            [self.navigationController pushViewController:workView animated:YES];}
            break;
            case 4:
            [self setupDateView:DateTypeOfStart];
            break;
            case 5:
            [self imagePIckerSelect];
            break;
            case 8:
            [self setupDateView:DateTypeOfStart];
            break;
            case 10:
            [self setupDateView:DateTypeOfStart];
            break;
        default:
            break;
    }
    self.a = button.tag;
}
#pragma mark - 照片
-(void)imagePIckerSelect{
    //相册
    __weak typeof (self) myslef =self;
    UIAlertController *alertController=[UIAlertController alertControllerWithTitle:@"請選擇" message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *canceAction=[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
    UIAlertAction * photoAction=[UIAlertAction actionWithTitle:@"相機" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [myslef openCamera];
        
    }];
    UIAlertAction *cencterAction =[UIAlertAction actionWithTitle:@"相冊" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //相册
        [myslef openLocalPhoto];
        
    }];
    [alertController addAction:cencterAction];
    [alertController addAction:photoAction];
    [alertController addAction:canceAction];
    [self presentViewController:alertController animated:YES completion:nil];
}
- (void)openCamera{
    ZLCameraViewController *cameraVc = [[ZLCameraViewController alloc] init];
    // 拍照最多个数
    cameraVc.maxCount = 100;
    __weak typeof(self) weakSelf = self;
    cameraVc.callback = ^(NSArray *cameras){
        [weakSelf.arrayPhone addObjectsFromArray:cameras];
        UIImage * image =[[UIImage alloc]init];
        for (int i = 0; i < cameras.count; i ++) {
            ZLPhotoAssets *asset = cameras[i];
            if ([asset isKindOfClass: [ZLPhotoAssets class]]) {
                image = [asset aspectRatioImage];
            }else if ([asset isKindOfClass:[UIImage class]]) {
                image= (UIImage*) asset;
            }else if ( [asset isKindOfClass:[ZLCamera class]]){
                image = [asset thumbImage];
            }
            [weakSelf saveImageToPhotos:image];
        }
    };
    [cameraVc showPickerVc:self];
}
-(void)saveImageToPhotos:(UIImage*)savedImage
{
    UIImageWriteToSavedPhotosAlbum(savedImage, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
    
}
// 指定回调方法
- (void)image: (UIImage *) image didFinishSavingWithError: (NSError *) error contextInfo: (void *) contextInfo
{
    NSString *msg = nil ;
    
    if(error != NULL){
        
        msg = @"保存图片失败" ;
        
    }else{
        
        msg = @"保存图片成功" ;
    }
    
}
- (void)openLocalPhoto{
    ZLPhotoPickerViewController *pickerVc = [[ZLPhotoPickerViewController alloc] init];
    pickerVc.maxCount=60;
    pickerVc.status = PickerViewShowStatusCameraRoll;
    [pickerVc showPickerVc:self];
    
    __weak typeof(self) weakSelf = self;
    pickerVc.callBack = ^(NSArray *assets){
        [weakSelf.arrayPhone addObjectsFromArray:assets];
        NSLog(@"%@dd",weakSelf.arrayPhone);
       
    };
    
}
#pragma mark - 日期时间
-(void)setupDateView:(DateType)type{
    _pickerView = [UWDatePickerView instanceDatePickerView];
    _pickerView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 300);
    _pickerView.center=self.view.center;
    _pickerView.delegate = self;
    _pickerView.type = type;
    [self.view addSubview:_pickerView];
}
-(void)getSelectDate:(NSString *)date type:(DateType)type{
    switch (type) {
        case DateTypeOfStart:
            // TODO 日期确定选择
            if(self.a==4){
                self.timelable.text = date;
            }if (self.a==8) {
                self.figurelable.text = date;
            }if (self.a==10) {
                self.completelable.text = date;
            }
            break;
        case DateTypeOfEnd:
            // TODO 日期取消选择
            break;
        default:
            break;
    }
}
#pragma mark - textLable
-(void)textlable:(NSString *)title celllable:(UITableViewCell *)cell textView:(HYTextView * )textview {
    UILabel * labletext =[[UILabel alloc]init];
    labletext.frame = CGRectMake(5, 0, HYSCREENWITH-HYThree, HYSixTen);
    labletext.numberOfLines = 0;
    [labletext setFont:[UIFont systemFontOfSize:16]];
    labletext.text = title;
    [cell.contentView addSubview:labletext];
    textview.frame = CGRectMake(HYTen, HYSixTen, HYSCREENWITH -5, HYEIGHTTen);
    textview.center = CGPointMake(HYSCREENWITH/2, 98);
    [cell.contentView addSubview:textview];
    
}
#pragma mark -显示的lable
-(void)showlable:(UITableViewCell *)cell labletex:(UILabel*)lablee{
    
    UILabel * labler =[[UILabel alloc]init];
    labler.frame = CGRectMake(5, 60, HYSCREENWITH, 40);
    labler.numberOfLines  = 0;
    labler.backgroundColor = [UIColor blueColor];
     lablee=labler;
    [cell.contentView addSubview:labler];
}
#pragma mark - 显示lable
-(void)yeslableButton:(UIButton *)yesbutton nobutton:(UIButton *)nobutton cellconView:(UITableViewCell *)cell{
    yesbutton.frame = CGRectMake(HYSCREENWITH -145, HYFIFITen, HYFour,HYFour);
    UILabel * lable=[[UILabel alloc]init];
    lable.frame = CGRectMake(yesbutton.frame.origin.x+yesbutton.frame.size.width, HYTwo, HYThree, HYTwo);
    lable.text =@"Yes";
  
    [self buttonone:yesbutton select:@selector(clickyes:)];
        [cell.contentView addSubview:yesbutton];
    [cell.contentView addSubview:lable];
    nobutton.frame =CGRectMake(HYSCREENWITH - 70, HYFIFITen, HYFour, HYFour);
    [self buttonone:nobutton select:@selector(clickNo:)];
    UILabel * lable1=[[UILabel alloc]init];
    lable1.frame = CGRectMake(nobutton.frame.origin.x+nobutton.frame.size.width, HYTwo, cell.frame.size.width, HYTwo);
    lable1.text =@"NO";
    [cell.contentView addSubview:lable1];
    [cell.contentView addSubview:nobutton];
}
-(void)clickNo:(UIButton *)sender{
   
    sender.selected = !sender.selected;
    if (self.tufenNobutton.selected) {
        self.tufenYesbutton.selected = NO;
    }
    if (self.maintenanceNobutton.selected) {
        self.maintenanceYesbutton.selected= NO;
    }
    if (self.arrangeNobutton.selected) {
        self.arrangeYewbutton.selected = NO;
    }
}
-(void)clickyes:(UIButton*)sender{
    sender.selected = !sender.selected;
    if (self.tufenYesbutton.selected) {
        self.tufenNobutton.selected = NO;
    }if (self.maintenanceYesbutton.selected) {
        self.maintenanceNobutton.selected = NO;
    }if (self.arrangeYewbutton.selected) {
        self.arrangeNobutton.selected = NO;
    }
}
-(void)buttonone:(UIButton *)button  select:(SEL)action{
    [button setBackgroundImage:[UIImage imageNamed:@"off"] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"on"] forState:UIControlStateSelected];
    [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];

}
- (IBAction)pushSucess:(id)sender {
    HYSucessViewController * succe =[HYSucessViewController new];
    [self.navigationController pushViewController:succe animated:YES];
    succe.array = self.sucessArray;
    self.sucessArray = nil;
}
-(void)iccViewdelegate:(NSString *)iccimage idname:(NSString *)idname{
    
    self.iccShowlable.text = iccimage;
    self.idname=idname;
}
-(void)speciesView:(NSString *)speciesName{
        self.specieslable.text = speciesName;
   // [self.tablview reloadData];
   
}
-(void)categoryView:(NSString *)categoryName{
    self.categorlabe.text =categoryName;
}
-(void)workViewName:(NSString *)wakeName{
    
    self.worklabe.text = wakeName;
}
- (IBAction)submitClick:(id)sender {
    NSString * texticc = self.iccShowlable.text;
    if (texticc.length==0){
        [TSMessage showNotificationWithTitle:@"請輸入ICC號碼" subtitle:@"" type:TSMessageNotificationTypeError];
    return ;
    }
    NSMutableDictionary * parameters =[NSMutableDictionary dictionary];
    [self uploadValue:parameters];
    
    
    
    
    AFHTTPSessionManager * mgr =[AFHTTPSessionManager manager];
    mgr.requestSerializer =[AFHTTPRequestSerializer serializer];
    mgr.responseSerializer =[AFHTTPResponseSerializer serializer];
    
    __weak typeof(self) myself = self;
    self.view.userInteractionEnabled = NO;
    [self animationpen];
    
  //  [mgr POST:<#(nonnull NSString *)#> parameters:<#(nullable id)#> success:<#^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject)success#> failure:<#^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)failure#>]
    [mgr POST:HYNETworkPAth parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        //上传照片
        [myself uploadPhotoSucessfromData:formData];
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        [myself uploadsucesslate:responseObject];
        [self clickcance];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self faileupdow];
    }];
    
}
//上传动画
-(void)animationpen{
    [self.indicator startAnimation];
}
-(void)faileupdow{
    [TSMessage showNotificationWithTitle:@"註意" subtitle:@"提交失敗 重新提交" type: TSMessageNotificationTypeError];
    [self.indicator stopAnimationWithLoadText:@"失败" withType:YES];
    self.view.userInteractionEnabled = YES;
}
//成功之后
-(void)uploadsucesslate:(id _Nonnull)responseObject{
    [TSMessage showNotificationWithTitle:@"上傳成功" subtitle:@"" type:TSMessageNotificationTypeSuccess];
    [self.indicator stopAnimationWithLoadText:@"上傳成功" withType:YES];
    self.view.userInteractionEnabled = YES;
    NSString *namet =self.iccShowlable.text;
    [self.sucessArray addObject:namet];
    
}
-(void)uploadValue:(NSMutableDictionary *)parameres{
    
    parameres[@"iID"]=self.idname;
    parameres[@"iNo"]=self.iccShowlable.text;
    parameres[@"type"]=self.specieslable.text;
    parameres[@"rType"]=self.categorlabe.text;
    parameres[@"oType"]=self.worklabe.text;
    if (self.timelable.text.length==0) { 
        NSDate * date =[NSDate date];
        NSDateFormatter *formatter =[NSDateFormatter new];
        [formatter setDateFormat:@"yyyy-HH-dd hh:mm:ss"];
        NSString *time =[formatter stringFromDate:date];
        parameres[@"cDatetime"] =time;
    }else{
        parameres[@"cDatetime"]= self.timelable.text;

    }
    parameres[@"additionalRemarks"] =self.noteTextview.text;
    parameres[@"fDatetime"]= self.figurelable.text;
    parameres[@"repairDatetime"]=self.completelable.text;
    if (self.tufenYesbutton.selected) {
        parameres[@"bFace"]=@"yes";
    }else{
        parameres[@"bFace"]=@"no";
    }
   
    if (self.maintenanceYesbutton.selected) {
        parameres[@"bRepair"]= @"yes";
    }else{
        parameres[@"bRepair"]=@"no";
    }
   
    if (self.arrangeYewbutton.selected) {
        parameres[@"bRepairing"]=@"yes";
    }else{
        parameres[@"bRepairing"] = @"no";
    }
    parameres[@"repairScheduling"]=self.maintenanceTextview.text;
   
    
}
-(void)uploadPhotoSucessfromData:(id<AFMultipartFormData>_Nonnull) formData{
    if (self.arrayPhone.count != 0) {
        UIImage *image = [[UIImage alloc]init];
        //相机判断
        for (int i = 0; i < self.arrayPhone.count; i ++) {
            ZLPhotoAssets *asset = self.arrayPhone[i];
            if ([asset isKindOfClass: [ZLPhotoAssets class]]) {
                image = [asset aspectRatioImage];
            }else if ([asset isKindOfClass:[UIImage class]]) {
                image= (UIImage*) asset;
            }else if ( [asset isKindOfClass:[ZLCamera class]]){
                image = [asset thumbImage];
            }
            NSData * data = UIImageJPEGRepresentation( image, 0.9);
            if (data != nil) {
               
                [formData appendPartWithFileData:data name: [NSString stringWithFormat:@"scenePhotos%d",i] fileName:@"hh.jpg"  mimeType:@"jpeg"];
            }
        }
    }
}
- (IBAction)canceClick:(id)sender {
    [self clickcance];
}
-(void)clickcance{
    self.iccShowlable.text = nil;
    self.specieslable.text = nil;
    self.categorlabe.text = nil;
    self.worklabe.text =nil;
    self.noteTextview.text=nil;
    self.maintenanceTextview.text=nil;
    self.timelable.text =nil;
    self.completelable.text =nil;
    self.figurelable.text = nil;
    self.tufenYesbutton.selected=NO;
    self.tufenNobutton.selected=NO;
    self.maintenanceNobutton.selected=NO;
    self.maintenanceYesbutton.selected=NO;
    self.arrangeNobutton.selected=NO;
    self.arrangeYewbutton.selected= NO;
    self.idname=nil;
    [self.arrayPhone removeAllObjects];
}
#pragma mark - 键盘监听
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if([text isEqualToString:@"\n"])
        [textView resignFirstResponder];
    return YES;
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}
- (BOOL)shouldAutorotate
{
    return YES;
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
