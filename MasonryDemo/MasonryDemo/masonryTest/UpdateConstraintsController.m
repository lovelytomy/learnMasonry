//
//  UpdateConstraintsController.m
//  MasonryDemo
//
//  Created by tianqi on 2018/1/19.
//  Copyright © 2018年 com.wiscess. All rights reserved.
//

#import "UpdateConstraintsController.h"
#import "Masonry.h"

@interface UpdateConstraintsController ()
@property(nonatomic,strong) UIButton *growingBtn;
@property(nonatomic,assign) CGFloat  scacle;
@end

@implementation UpdateConstraintsController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.growingBtn=[UIButton buttonWithType:UIButtonTypeSystem];
    [self.growingBtn setTitle:@"点我变大" forState:UIControlStateNormal];
    self.growingBtn.layer.borderColor=[UIColor redColor].CGColor;
    self.growingBtn.layer.borderWidth=1;
    [self.growingBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.growingBtn];
    
    self.scacle=1.0;
    [self.growingBtn mas_makeConstraints:^(MASConstraintMaker *make){
        make.center.mas_equalTo(self.view);
        make.width.height.mas_equalTo(100*self.scacle);
        make.width.height.lessThanOrEqualTo(self.view.mas_width);
        
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

-(void)btnAction:(id)sender{
    self.scacle+=0.2;
    [self.view setNeedsUpdateConstraints];
    [self.view updateConstraintsIfNeeded];
    [UIView animateWithDuration:0.3 animations:^(void){
        [self.view layoutIfNeeded];
    }];
}

-(void)updateViewConstraints{
    [self.growingBtn mas_updateConstraints:^(MASConstraintMaker *make){
        make.center.mas_equalTo(self.view);
        make.width.height.mas_equalTo(100*self.scacle);
        make.width.height.lessThanOrEqualTo(self.view.mas_width);
        
    }];
    [super updateViewConstraints];
}
@end
