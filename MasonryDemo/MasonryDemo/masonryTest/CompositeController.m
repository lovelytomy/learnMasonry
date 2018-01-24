//
//  CompositeController.m
//  MasonryDemo
//
//  Created by tianqi on 2018/1/22.
//  Copyright © 2018年 com.wiscess. All rights reserved.
//

#import "CompositeController.h"
#import "Masonry.h"

@interface CompositeController ()
@property(nonatomic,strong)NSMutableArray *viewArray;
@property(nonatomic,assign)BOOL isNormal;
@end

@implementation CompositeController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *lastView=self.view;
    for (NSInteger i=0; i<6; i++) {
        UIView *tempView=[UIView new];
        tempView.backgroundColor=[self randomColor];
        tempView.layer.borderColor=[UIColor blackColor].CGColor;
        tempView.layer.borderWidth=3;
        [self.view addSubview:tempView];
       
        
        [tempView mas_makeConstraints:^(MASConstraintMaker *make){
            make.edges.equalTo(lastView).insets(UIEdgeInsetsMake(20, 20, 20, 20));
        }];
        lastView=tempView;
        [self.viewArray addObject:tempView];
        UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
        [tempView addGestureRecognizer:tap];
        
        self.isNormal=YES;
    }
    
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
-(void)tapAction{
     UIView *lastView = self.view;
    if(self.isNormal){
        for (NSInteger i=self.viewArray.count-1; i>=0; --i) {
            UIView *tempView=self.viewArray[i];
            [tempView mas_remakeConstraints:^(MASConstraintMaker *make){
                make.edges.equalTo(lastView).insets(UIEdgeInsetsMake(20, 20, 20, 20));
            }];
            [self.view bringSubviewToFront:tempView];
            lastView=tempView;
        }
    }else{
        for (NSInteger i=0; i<self.viewArray.count; ++i) {
            UIView *tempView=self.viewArray[i];
            [tempView mas_remakeConstraints:^(MASConstraintMaker *make){
                make.edges.equalTo(lastView).insets(UIEdgeInsetsMake(20, 20, 20, 20));
            }];
            [self.view bringSubviewToFront:tempView];
            lastView=tempView;
        }
    }
    [self.view setNeedsUpdateConstraints];
    [self.view updateConstraintsIfNeeded];
    [UIView animateWithDuration:0.3 animations:^{
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished){
        self.isNormal=!self.isNormal;
    }];
    
}
-(NSMutableArray *)viewArray{
    if (!_viewArray) {
        _viewArray=[[NSMutableArray alloc] init];
    }
    return _viewArray;
}
-(UIColor *)randomColor{
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}
@end
