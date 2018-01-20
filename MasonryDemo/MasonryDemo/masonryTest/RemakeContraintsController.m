//
//  RemakeContraintsController.m
//  MasonryDemo
//
//  Created by tianqi on 2018/1/20.
//  Copyright © 2018年 com.wiscess. All rights reserved.
//

#import "RemakeContraintsController.h"
#import "Masonry.h"

@interface RemakeContraintsController ()
@property(nonatomic,strong)UIButton *growingBtn;
@property(nonatomic,assign)BOOL isExpanded;
@end

@implementation RemakeContraintsController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.growingBtn=[UIButton buttonWithType:UIButtonTypeSystem];
    self.growingBtn.backgroundColor=[UIColor redColor];
    self.growingBtn.layer.borderWidth=1;
    self.growingBtn.layer.borderColor=[UIColor greenColor].CGColor;
    [self.growingBtn setTitle:@"点我变大" forState:UIControlStateNormal];
    [self.growingBtn addTarget:self action:@selector(touchAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.growingBtn];
    self.isExpanded=NO;
}

-(void)updateViewConstraints{
    __weak __typeof(self) weakself=self;
    [self.growingBtn mas_remakeConstraints:^(MASConstraintMaker *make){
        make.top.left.right.mas_equalTo(0);
        if (weakself.isExpanded) {
            make.bottom.mas_equalTo(0);
        }else{
            make.bottom.mas_equalTo(-350);
        }
        
    }];
    [super updateViewConstraints];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchAction:(id)sender{
    self.isExpanded=!self.isExpanded;
    if (self.isExpanded) {
        [self.growingBtn setTitle:@"点我缩小" forState:UIControlStateNormal];
    }else{
        [self.growingBtn setTitle:@"点我变大" forState:UIControlStateNormal];
    }
    [self.view setNeedsUpdateConstraints];
    [self.view updateConstraintsIfNeeded];
    [UIView animateWithDuration:0.3 animations:^{
        [self.view layoutIfNeeded];
    }];
}

@end
