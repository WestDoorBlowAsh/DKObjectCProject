//
//  ZZFlexTestListVC.m
//  DKObjectC
//
//  Created by 邓凯 on 2020/12/4.
//  Copyright © 2020 邓凯. All rights reserved.
//

#import "ZZFlexTestListVC.h"
#import "DKBaseTableFlexCell.h"

@interface ZZFlexTestListVC ()

@end

@implementation ZZFlexTestListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView.zz_setup.masonry(^(__kindof UIView *sender, MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    });
    
    // 清空所有数据
    self.clear();
    
    // 添加section 1
    {
        // section 标识
        NSInteger sectionType = 1;
        /*
         添加section
         sectionInsets: section边距
         minimumLineSpacing: 行间距
         minimumInteritemSpacing: 列间距
         */
        self.angel.addSection(sectionType).sectionInsets(UIEdgeInsetsMake(15, 15, 15, 15)).minimumLineSpacing(15).minimumInteritemSpacing(15);
        
        /// 设置section header，footer亦然
        self.angel.setHeader([UITableViewHeaderFooterView class]).toSection(sectionType);
        
        /*
         往section添加cell
         withDataModel：cell数据模型
         selectedAction：cell点击事件
         eventAction: cell内部事件，业务方自行设置和调用，eventType为事件类型、model是事件数据
         viewTag: cell标识，便于调试，或用于查找定位或作为插入其他cell的锚点
         */
        self.angel.addCell([UITableViewCell class]).toSection(sectionType).withDataModel(@"hello")
        .selectedAction(^ (id model) {
            NSLog(@"cell 点击事件");
        })
        .eventAction(^ id(NSInteger eventType, id model) {
            NSLog(@"cell 内部事件，类型：%ld, 模型: %@", eventType, model);
            return nil;
        })
        .viewTag(10001);
        
        /*
         往section批量添加cell
         withDataModelArray：cell数据模型数组，cell个数由数组元素个数决定
         delegate：为cell设置代理
         */
        self.angel.addCells([UITableViewCell class]).toSection(sectionType).withDataModelArray(@[@"1", @"2", @"3"])
        .configAction(^(UITableViewCell *cell, NSString *model) {   // 配置cell，等价于cellForRowAtIndexPath时的配置逻辑
            cell.textLabel.text = model;
        })
        .selectedAction(^ (id model) {
            NSLog(@"cell 点击事件，数据模型为：%@", model);
        });//.delegate(self);
    }
    
    // 刷新数据
    [self.angel reloadView];
}

@end
