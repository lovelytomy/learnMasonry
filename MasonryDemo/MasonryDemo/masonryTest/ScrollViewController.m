
//
//  ScrollViewController.m
//  MasonryDemo
//
//  Created by tianqi on 2018/1/24.
//  Copyright © 2018年 com.wiscess. All rights reserved.
//

#import "ScrollViewController.h"
#import "Masonry.h"
@interface ScrollViewController ()
@property(nonatomic,strong) UIScrollView *scrollView;
@end

@implementation ScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIScrollView *scrollview=[UIScrollView new];
    scrollview.pagingEnabled=NO;
    scrollview.backgroundColor=[UIColor lightGrayColor];
    [self.view addSubview:scrollview];
    self.scrollView=scrollview;
    
    CGFloat screenWidth=[UIScreen mainScreen].bounds.size.width;
    UILabel *lastLable=nil;
    for(NSInteger i=0;i<20;i++){
        UILabel *lable=[UILabel new];
        lable.preferredMaxLayoutWidth=screenWidth-30;
        lable.textAlignment=NSTextAlignmentLeft;
        lable.numberOfLines=0;
        lable.layer.borderColor=[UIColor greenColor].CGColor;
        lable.layer.borderWidth=2;
        lable.text=[self randomText];
        lable.textColor=[self randomColor];
        [scrollview addSubview:lable];
        [lable mas_makeConstraints:^(MASConstraintMaker *make){
            make.left.mas_equalTo(15);
            make.right.mas_equalTo(self.view).offset(-15);
            if (!lastLable) {
                make.top.mas_equalTo(self.scrollView).offset(20);
            }else{
                make.top.mas_equalTo(lastLable.mas_bottom).offset(20);
            }
        }];
        lastLable=lable;
        
    }
    [scrollview mas_makeConstraints:^(MASConstraintMaker *make){
        make.edges.mas_equalTo(self.view);
        make.bottom.mas_equalTo(lastLable.mas_bottom).offset(20);
    }];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (UIColor *)randomColor {
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

- (NSString *)randomText {
    CGFloat length = arc4random() % 50 + 5;
    
    NSMutableString *str = [[NSMutableString alloc] init];
    for (NSUInteger i = 0; i < length; ++i) {
        [str appendString:@"测试数据很长，"];
    }
    
    return str;
}

@end
