//
//  AspectFitController.m
//  MasonryDemo
//
//  Created by tianqi on 2018/1/23.
//  Copyright © 2018年 com.wiscess. All rights reserved.
//

#import "AspectFitController.h"
#import "Masonry.h"
@interface AspectFitController ()

@end

@implementation AspectFitController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *topView=[UIView new];
    topView.backgroundColor=[UIColor redColor];
    [self.view addSubview:topView];
    
    UIView *topInnerView=[UIView new];
    topInnerView.backgroundColor=[UIColor greenColor];
    [topView addSubview:topInnerView];
    
    UIView *bottomView=[UIView new];
    bottomView.backgroundColor=[UIColor blackColor];
    [self.view addSubview:bottomView];
    
    UIView *bottomInnerView=[UIView new];
    bottomInnerView.backgroundColor=[UIColor blueColor];
    [bottomView addSubview:bottomInnerView];
    
    [topView mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.left.right.mas_equalTo(0);
        make.height.mas_equalTo(bottomView);
    }];
    
    [topInnerView mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.right.mas_equalTo(0);
        make.center.mas_equalTo(topView);
        make.width.mas_equalTo(topInnerView.mas_height).multipliedBy(3);
        
        make.width.height.mas_equalTo(topView).priorityLow();
        make.width.height.lessThanOrEqualTo(topView);

    }];
    
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.mas_equalTo(topView.mas_bottom);
        make.left.right.bottom.mas_equalTo(0);
    }];
     
     [bottomInnerView mas_makeConstraints:^(MASConstraintMaker *make){
         make.top.bottom.mas_lessThanOrEqualTo(0);
         make.height.mas_equalTo(bottomInnerView.mas_width).multipliedBy(3);
         make.center.mas_equalTo(bottomView);
         make.width.height.mas_equalTo(bottomView).priorityLow();
         make.width.height.mas_lessThanOrEqualTo(bottomView);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
