//
//  ViewController.m
//  DKObjectC
//
//  Created by 邓凯 on 2020/11/24.
//  Copyright © 2020 邓凯. All rights reserved.
//

#import "ViewController.h"
#import "ZZFLEX.h"
#import <Masonry/Masonry.h>

@interface ViewController ()

@property (nonatomic, strong) UIView *myView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 快速创建
    UIButton *button = self.view.addButton(1)
    // 设置字体，各状态字色、背景色
    .title(@"dian wo")
    .titleFont([UIFont systemFontOfSize:12])
    .titleColor([UIColor blackColor]).titleColorHL([UIColor redColor]).titleColorDisabled([UIColor grayColor])
    .backgroundColor([UIColor whiteColor]).backgroundColorHL([UIColor yellowColor])
    // 设置圆角、阴影
    .cornerRadius(5.0f).shadow(CGSizeZero, 5.0f, [UIColor grayColor], 1.0)
    // 设置事件
    .eventTouchDown(^ (UIButton *sender) {
        NSLog(@"touch down");
    })
    .eventTouchUpInside(^ (UIButton *sender) {
        NSLog(@"touch inside");
    })
    // 设置约束（Masonry）
    .masonry(^ (UIButton *sender, MASConstraintMaker *make) {
        make.left.top.mas_equalTo(100);
        make.size.mas_equalTo(CGSizeMake(80, 30));
    })
    .view;
    
    // 一般创建
    UIView *view = UIView.zz_create(1001)
    .backgroundColor([UIColor yellowColor])
    .view;
    [self.view addSubview:view];
    
    // 设置属性
    view.zz_setup.masonry(^ (UIView *sender, MASConstraintMaker *make) {
        make.left.mas_equalTo(button);
        make.top.mas_equalTo(button.mas_bottom).offset(100);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    });

    // 添加分割线
    view.addSeparator(ZZSeparatorPositionTop).color([UIColor grayColor]).beginAt(0).endAt(50).borderWidth(2);

    // 设置圆角(❌)
//    view.setCornor(ZZCornerPositionRight | ZZCornerPositionBottom).radius(10);
    self.myView = view;
    
    // 设置圆角(✅)
    self.view.addView(1002).frame(CGRectMake(100, 400, 100, 100))
    .backgroundColor([UIColor blueColor]).view
    .setCornor(ZZCornerPositionLeft | ZZCornerPositionTop).radius(30.0f).color([UIColor grayColor]).borderWidth(1);
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    // 设置圆角(✅)
    self.myView.setCornor(ZZCornerPositionRight | ZZCornerPositionBottom).radius(10);
}

@end
