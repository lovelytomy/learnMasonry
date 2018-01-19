//
//  TQBaseViewController.m
//  MasonryDemo
//
//  Created by tianqi on 2018/1/19.
//  Copyright © 2018年 com.wiscess. All rights reserved.
//

#import "TQBaseViewController.h"

@interface TQBaseViewController ()

@end

@implementation TQBaseViewController

-(instancetype)initWithTitle:(NSString *)title{
    if(self=[super init]){
        self.title=title;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    if(kIOSVersion>7.0){
        self.automaticallyAdjustsScrollViewInsets=NO;
        self.edgesForExtendedLayout=UIRectEdgeNone;
    }
    self.view.backgroundColor=[UIColor whiteColor];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
