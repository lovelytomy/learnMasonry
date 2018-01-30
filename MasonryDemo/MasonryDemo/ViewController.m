//
//  ViewController.m
//  MasonryDemo
//
//  Created by tianqi on 2018/1/19.
//  Copyright © 2018年 com.wiscess. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "BaseMasonryController.h"
#import "UpdateConstraintsController.h"
#import "RemakeContraintsController.h"
#import "TotalUpdateController.h"
#import "CompositeController.h"
#import "AspectFitController.h"
#import "BasicAnimatedController.h"
#import "ScrollViewController.h"
#import "TableViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView *tableView;
@property(nonatomic,strong) NSArray     *controllers;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView=[UITableView new];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make){
         make.edges.mas_equalTo(self.view);
     }];
    
    
    self.controllers=@[
                       [[BaseMasonryController alloc] initWithTitle:@"Masonry基础使用"],
                       [[UpdateConstraintsController alloc] initWithTitle:@"Masonry动画更新约束"],
                       [[RemakeContraintsController alloc] initWithTitle:@"Masonry动画重新添加约束"],
                       [[TotalUpdateController alloc] initWithTitle:@"整体动画更新约束"],
                       [[CompositeController alloc] initWithTitle:@"复合view循环约束"],
                       [[AspectFitController alloc] initWithTitle:@"AspectFitController"],
                       [[BasicAnimatedController alloc] initWithTitle:@"基础动画"],
                       [[ScrollViewController alloc] initWithTitle:@"scrollview"],
                       [[TableViewController alloc] initWithTitle:@"masonry约束UITableView"]
                       ];
    
   
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.controllers.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString  *cellID=@"masonryCell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID];
    if(!cell){
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    UIViewController *viewController=self.controllers[indexPath.row];
    cell.textLabel.text=viewController.title;
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController *viewController=self.controllers[indexPath.row];
    [self.navigationController pushViewController:viewController animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
