//
//  TestModel.h
//  MasonryDemo
//
//  Created by tianqi on 2018/1/30.
//  Copyright © 2018年 com.wiscess. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestModel : NSObject
@property(nonatomic,strong) NSString *title;
@property(nonatomic,strong) NSString *desc;
@property(nonatomic,assign) BOOL isExpanded;
@end
