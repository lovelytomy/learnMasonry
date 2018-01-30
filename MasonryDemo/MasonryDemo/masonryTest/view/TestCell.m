//
//  TestCell.m
//  MasonryDemo
//
//  Created by tianqi on 2018/1/30.
//  Copyright © 2018年 com.wiscess. All rights reserved.
//

#import "TestCell.h"
#import "Masonry.h"

@implementation TestCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        CGFloat W=[UIScreen mainScreen].bounds.size.width;
        UIImageView *imgView=[UIImageView new];
        imgView.backgroundColor=[UIColor greenColor];
        imgView.layer.cornerRadius=35;
        imgView.layer.borderColor=[UIColor redColor].CGColor;
        imgView.layer.borderWidth=1.0;
        [self.contentView addSubview:imgView];
        
        [imgView mas_makeConstraints:^(MASConstraintMaker *make){
            make.left.mas_equalTo(15);
            make.size.mas_equalTo(CGSizeMake(70, 70));
            make.top.mas_equalTo(15);
        }];
        
        self.titleLalbe=[UILabel new];
        self.titleLalbe.textColor=[UIColor blackColor];
        self.titleLalbe.font=[UIFont systemFontOfSize:16];
        self.titleLalbe.textAlignment=NSTextAlignmentLeft;
        self.titleLalbe.numberOfLines=0;
        self.titleLalbe.preferredMaxLayoutWidth=W-100-15;
        [self.contentView addSubview:self.titleLalbe];
        [self.titleLalbe mas_makeConstraints:^(MASConstraintMaker *make){
            make.left.mas_equalTo(imgView.mas_right).offset(15);
            make.top.mas_equalTo(imgView);
            make.right.mas_equalTo(self.contentView).offset(-15);
        }];
        
        self.descLable=[UILabel new];
        self.descLable.textColor=[UIColor blackColor];
        self.descLable.textAlignment=NSTextAlignmentLeft;
        self.descLable.font=[UIFont systemFontOfSize:13];
        self.descLable.numberOfLines=0;
        self.descLable.preferredMaxLayoutWidth=W-100-15;
        [self.contentView addSubview:self.descLable];
        [self.descLable mas_makeConstraints:^(MASConstraintMaker *make){
            make.top.mas_equalTo(self.titleLalbe.mas_bottom).offset(20);
            make.left.mas_equalTo(imgView.mas_right).offset(15);
            make.right.mas_equalTo(self.contentView).offset(-15);
        }];
        self.descLable.userInteractionEnabled=YES;
        UITapGestureRecognizer *gesture=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
        [self.descLable addGestureRecognizer:gesture];
        
        UIView *lineView=[[UIView alloc] init];
        lineView.backgroundColor=[UIColor lightGrayColor];
        [self.contentView addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make){
            make.top.mas_equalTo(self.descLable.mas_bottom).offset(19.5);
            make.left.mas_equalTo(15);
            make.right.mas_equalTo(0);
            make.height.mas_equalTo(0.5);
        }];

    }
    return self;
}

-(void)configCellWithModel:(TestModel *)model{
    self.model=model;
    self.titleLalbe.text=model.title;
    self.descLable.text=model.desc;
    if (model.isExpanded) {
        [self.descLable mas_remakeConstraints:^(MASConstraintMaker *make){
            make.left.mas_equalTo(self.titleLalbe);
            make.right.mas_equalTo(self.titleLalbe);
            make.top.mas_equalTo(self.titleLalbe.mas_bottom).offset(20);
        }];
    }else{
        [self.descLable mas_remakeConstraints:^(MASConstraintMaker *make){
            make.left.mas_equalTo(self.titleLalbe);
            make.right.mas_equalTo(self.titleLalbe);
            make.top.mas_equalTo(self.titleLalbe.mas_bottom).offset(20);
            make.height.mas_equalTo(40);
        }];
    }
}
-(void)tapAction{
    self.model.isExpanded=!self.model.isExpanded;
   
    if (self.block) {
        self.block(self.indexPath);
    }
    [self configCellWithModel:self.model];
    [self.contentView setNeedsUpdateConstraints];
    [self.contentView updateConstraintsIfNeeded];
    [UIView animateWithDuration:0.3 animations:^(void){
        [self.contentView layoutIfNeeded];
    }];
}

+(CGFloat)heightWithModel:(TestModel *)model{
    TestCell *cell=[[TestCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@""];
    [cell configCellWithModel:model];
    [cell layoutIfNeeded];
    CGRect frame=cell.descLable.frame;
    return frame.origin.y+frame.size.height+20;
    
}






@end
