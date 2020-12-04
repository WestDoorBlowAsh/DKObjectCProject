//
//  DKFactory.h
//  DKObjectC
//
//  Created by 邓凯 on 2020/12/4.
//  Copyright © 2020 邓凯. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DKFactory : NSObject

+ (UIWindow *)setupWindow:(UIWindow *)window scene:(nullable id)scene;

@end

NS_ASSUME_NONNULL_END
