//
//  TotalUpdateController.m
//  MasonryDemo
//
//  Created by tianqi on 2018/1/22.
//  Copyright © 2018年 com.wiscess. All rights reserved.
//

#import "TotalUpdateController.h"
#import "Masonry.h"

@interface TotalUpdateController ()
@property (nonatomic, strong) UIView *purpleView;
@property (nonatomic, strong) UIView *orangeView;
@property (nonatomic, assign) BOOL isExpaned;
@end

@implementation TotalUpdateController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *purpleView=[UIView new];
    purpleView.backgroundColor=[UIColor purpleColor];
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [purpleView addGestureRecognizer:tap];
    [self.view addSubview:purpleView];
    self.purpleView=purpleView;
    
    UIView *orangeView=[UIView new];
    orangeView.backgroundColor=[UIColor orangeColor];
    [self.view addSubview:orangeView];
    self.orangeView=orangeView;
    [self updateWithExpand:NO animated:NO];
    
    UILabel *descLable=[UILabel new];
    descLable.numberOfLines=0;
    descLable.textColor=[UIColor redColor];
    descLable.font=[UIFont systemFontOfSize:16];
    descLable.textAlignment = NSTextAlignmentCenter;
    descLable.text=@"点击purple部分放大，orange部分最大值250，最小值90";
    [self.purpleView addSubview:descLable];
    [descLable mas_makeConstraints:^(MASConstraintMaker *make){
        make.bottom.mas_equalTo(0);
        make.left.right.mas_equalTo(0);
    }];
    
    
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)updateWithExpand:(BOOL)isExpanded animated:(BOOL)animated {
    self.isExpaned = isExpanded;
    
    [self.purpleView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        if (isExpanded) {
            make.bottom.mas_equalTo(-20);
        } else {
            make.bottom.mas_equalTo(-300);
        }
    }];
    
    [self.orangeView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.purpleView);
        
        // 这里使用优先级处理
        // 设置其最大值为250，最小值为90
        if (!isExpanded) {
            make.width.height.mas_equalTo(100 * 0.5).priorityLow();
        } else {
            make.width.height.mas_equalTo(100 * 3).priorityLow();
        }
        
        // 最大值为250
        make.width.height.lessThanOrEqualTo(@250);
        
        // 最小值为90
        make.width.height.greaterThanOrEqualTo(@90);
    }];
    
    if (animated) {
        [self.view setNeedsUpdateConstraints];
        [self.view updateConstraintsIfNeeded];
        
        [UIView animateWithDuration:0.5 animations:^{
            [self.view layoutIfNeeded];
        }];
    }
}
-(void)tapAction:(UITapGestureRecognizer *)reg{

    [self updateWithExpand:!self.isExpaned animated:YES];
}

@end
