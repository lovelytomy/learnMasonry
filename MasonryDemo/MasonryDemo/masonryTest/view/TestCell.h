//
//  TestCell.h
//  MasonryDemo
//
//  Created by tianqi on 2018/1/30.
//  Copyright © 2018年 com.wiscess. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TestModel.h"


typedef void (^TestBlock)(NSIndexPath *indexpath);
@interface TestCell : UITableViewCell

@property(nonatomic,strong)UILabel *titleLalbe;
@property(nonatomic,strong)UILabel *descLable;
@property(nonatomic,copy)  TestBlock block;
@property(nonatomic,strong)TestModel *model;
@property(nonatomic,strong)NSIndexPath *indexPath;

-(void)configCellWithModel:(TestModel *)model;
+(CGFloat)heightWithModel:(TestModel *)model;
@end
