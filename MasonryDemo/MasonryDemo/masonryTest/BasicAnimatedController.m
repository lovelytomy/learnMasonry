//
//  BasicAnimatedController.m
//  MasonryDemo
//
//  Created by tianqi on 2018/1/23.
//  Copyright © 2018年 com.wiscess. All rights reserved.
//

#import "BasicAnimatedController.h"
#import "Masonry.h"

@interface BasicAnimatedController ()

@property (nonatomic, strong) UIView *greenView;
@property (nonatomic, strong) UIView *redView;
@property (nonatomic, strong) UIView *blueView;

@property (nonatomic, assign) CGFloat padding;
@end

@implementation BasicAnimatedController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *greenView=[UIView new];
    greenView.backgroundColor=[UIColor greenColor];
    greenView.layer.borderColor=[UIColor blackColor].CGColor;
    greenView.layer.borderWidth=2;
    [self.view addSubview:greenView];
    
    UIView *redView=[UIView new];
    redView.backgroundColor=[UIColor redColor];
    redView.layer.borderWidth=2;
    redView.layer.borderColor=[UIColor blackColor].CGColor;
    [self.view addSubview:redView];
    
    UIView *blueView=[UIView new];
    blueView.backgroundColor=[UIColor blueColor];
    blueView.layer.borderWidth=2;
    blueView.layer.borderColor=[UIColor blackColor].CGColor;
    [self.view addSubview:blueView];
    
    self.padding=10;
    CGFloat padding = self.padding;
    [greenView mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.left.mas_equalTo(padding);
        make.right.mas_equalTo(redView.mas_left).offset(-padding);
        make.bottom.mas_equalTo(blueView.mas_top).offset(-padding).priorityLow();
        make.height.mas_equalTo(@[redView,blueView]);
        make.width.mas_equalTo(redView);
        make.height.lessThanOrEqualTo(self.view);
        
    }];
    [redView mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.height.bottom.width.mas_equalTo(greenView);
        make.left.mas_equalTo(greenView.mas_right).offset(padding);
        make.right.mas_equalTo(-padding);
    }];
    [blueView mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.mas_equalTo(padding);
        make.right.mas_equalTo(-padding);
        make.bottom.mas_equalTo(-padding);
    }];
    self.greenView=greenView;
    self.redView=redView;
    self.blueView=blueView;
    
    [self updateAnimated:NO];
    
    
    
}
- (void)updateAnimated:(BOOL)animated {
    CGFloat padding = self.padding >= 350 ? 10 : 350;
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    [self.blueView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-padding);
        make.top.mas_equalTo((screenHeight - 64) / 2 - 5);
    }];
    
    if (animated) {
        [self.view setNeedsUpdateConstraints];
        [self.view updateConstraintsIfNeeded];
        
        [UIView animateWithDuration:0.5 animations:^{
            [self.view layoutIfNeeded];
        } completion:^(BOOL finished) {
            self.padding = padding;
            [self updateAnimated:YES];
        }];
    } else {
        [self.view layoutIfNeeded];
        
        [self updateAnimated:YES];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
