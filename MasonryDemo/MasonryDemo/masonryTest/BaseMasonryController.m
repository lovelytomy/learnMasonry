//
//  BaseMasonryController.m
//  MasonryDemo
//
//  Created by tianqi on 2018/1/19.
//  Copyright © 2018年 com.wiscess. All rights reserved.
//

#import "BaseMasonryController.h"
#import "Masonry.h"

@interface BaseMasonryController ()

@end

@implementation BaseMasonryController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    UIView *greenView=[UIView new];
    greenView.backgroundColor=[UIColor greenColor];
    [self.view addSubview:greenView];
    
    UIView *redView=[UIView new];
    redView.backgroundColor=[UIColor redColor];
    [self.view addSubview:redView];
    
    UIView *blueView=[UIView new];
    blueView.backgroundColor=[UIColor blueColor];
    [self.view addSubview:blueView];
    
    
    CGFloat padding=10;
    [greenView mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.mas_equalTo(padding);
        make.left.mas_equalTo(padding);
        make.right.mas_equalTo(redView.mas_left).offset(-padding);
        make.bottom.mas_equalTo(blueView.mas_top).offset(-padding);
        make.height.mas_equalTo(@[redView,blueView]);
        make.width.mas_equalTo(redView);
    }];
    
    [redView mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.height.bottom.mas_equalTo(greenView);
//        make.left.mas_equalTo(greenView.mas_right).offset(padding);
        make.right.mas_equalTo(-padding);
    }];
    
    [blueView mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.mas_equalTo(padding);
        make.right.mas_equalTo(-padding);
        make.bottom.mas_equalTo(-padding);
    }];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}



@end
