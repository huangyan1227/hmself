//
//  HYTextView.m
//
//  Created by bidiao on 15/11/19.
//  Copyright © 2015年 bidiao. All rights reserved.
//

#import "HYTextView.h"
#import "UIView+Extension.h"
@interface HYTextView()<UITextViewDelegate>

@property(nonatomic,weak)UILabel *placehoderLabel;

@end

@implementation HYTextView

-(id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        // 添加一个显示提醒文字的label（显示占位文字的label）
        UILabel *placehoderLabel = [[UILabel alloc] init];
        placehoderLabel.numberOfLines = 0;
        placehoderLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:placehoderLabel];
        self.placehoderLabel = placehoderLabel;
        
        // 设置默认的占位文字颜色
        self.placehoderColor = [UIColor lightGrayColor];
        
        // 设置默认的字体
        self.font = [UIFont systemFontOfSize:14];
        self.layer.borderColor=[UIColor blackColor].CGColor;
        self.layer.borderWidth=1;
        self.layer.cornerRadius=6;
        self.layer.masksToBounds=YES;

        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:self];
        
    }
    
    return self;
    
}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
#pragma mark -监听文字改变

- (void)textDidChange
{
    //    if (self.text.length == 0) { // 显示占位文字
    //        self.placehoderLabel.hidden = NO;
    //    } else { // 隐藏占位文字
    //        self.placehoderLabel.hidden = YES;
    //    }
    self.placehoderLabel.hidden = (self.text.length != 0);
}
#pragma mark - 公共方法
- (void)setText:(NSString *)text
{
    [super setText:text];
    
    [self textDidChange];
}

- (void)setPlacehoder:(NSString *)placehoder
{

    _placehoder = [placehoder copy];
    
    // 设置文字
    self.placehoderLabel.text = placehoder;
    
    // 重新计算子控件的fame
    [self setNeedsLayout];
}

- (void)setPlacehoderColor:(UIColor *)placehoderColor
{
    _placehoderColor = placehoderColor;
    
    // 设置颜色
    self.placehoderLabel.textColor = placehoderColor;
}

- (void)setFont:(UIFont *)font
{
    [super setFont:font];
    
    self.placehoderLabel.font = font;
    
    // 重新计算子控件的fame
    [self setNeedsLayout];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.placehoderLabel.y = 8;
    self.placehoderLabel.x = 5;
    self.placehoderLabel.width = self.width - 2 * self.placehoderLabel.x;
    // 根据文字计算label的高度
    CGSize maxSize = CGSizeMake(self.placehoderLabel.width, MAXFLOAT);
    //CGSize placehoderSize = [self.placehoder sizeWithFont:self.placehoderLabel.font constrainedToSize:maxSize];
    
    CGFloat font =self.placehoderLabel.font.descender;
    CGRect rect=[self.placehoder boundingRectWithSize:maxSize options:NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]} context:nil];
    //self.placehoderLabel.height = placehoderSize.height;
    self.placehoderLabel.height =rect.size.height;
}











@end
