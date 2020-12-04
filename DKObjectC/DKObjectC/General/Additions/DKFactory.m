//
//  DKFactory.m
//  DKObjectC
//
//  Created by 邓凯 on 2020/12/4.
//  Copyright © 2020 邓凯. All rights reserved.
//

#import "DKFactory.h"
#import "DKMainTabBarViewController.h"

@implementation DKFactory

+ (UIWindow *)setupWindow:(UIWindow *)window scene:(nullable id)scene {
    
    if (@available(iOS 13.0, *)) {
        UIWindowScene *windowScene = (UIWindowScene *)scene;
        window.frame = windowScene.coordinateSpace.bounds;
        window.backgroundColor = [UIColor whiteColor];
        window.rootViewController = [self setupRootViewController];
        [window makeKeyAndVisible];
    } else {
        if (!window) {
            window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        }
        window.backgroundColor = [UIColor whiteColor];
        window.rootViewController = [self setupRootViewController];
        [window makeKeyAndVisible];
    }
    
    return window;
}

+ (UIViewController *)setupRootViewController {
    return [DKMainTabBarViewController new];
}

@end
