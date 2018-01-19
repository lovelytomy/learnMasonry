//
//  TQBaseViewController.h
//  MasonryDemo
//
//  Created by tianqi on 2018/1/19.
//  Copyright © 2018年 com.wiscess. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kWeakObject(obj) __weak __typeof(obj) weakObject=obj;
#define kIOSVersion ((float)[[[UIDevice currentDevice] systemVersion] doubleValue])
@interface TQBaseViewController : UIViewController
-(instancetype)initWithTitle:(NSString *)title;
@end
