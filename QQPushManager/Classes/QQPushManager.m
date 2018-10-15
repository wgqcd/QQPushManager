//
//  QQPushManager.m
//  QQPushManager_Example
//
//  Created by 魏国强 on 2018/10/15.
//  Copyright © 2018 魏国强. All rights reserved.
//
#import <>
#import "QQPushManager.h"
@interface QQPushManager ()

@end
@implementation QQPushManager
+ (instancetype)sharedManager{
    static QQPushManager *sharedManager;
    if (!sharedManager) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            sharedManager = [[QQPushManager alloc]init];
        });
    }
    return sharedManager;
}
+ (void)registerService:(NSString *)appKey{///<注册服务
    [
}
+ (void)registerModule:(NSString*)module event:(void(^)(NSDictionary *userInfo))event{ ///<注册模块 拦截推送点击事件
}
+ (void)addTag:(NSSet*)tags completion:(void(^)(NSInteger iResCode, NSSet *iTags, NSInteger seq))completion{ ///<添加标签
}
+ (void)deleteTag:(NSSet*)tags completion:(void(^)(NSInteger iResCode, NSSet *iTags, NSInteger seq))completion{///<删除标签
}
+ (void)addAlia:(NSString*)iAlias completion:(void(^)(NSInteger iResCode, NSString *iAlias, NSInteger seq))completion{///<添加别名
}
+ (void)deleteAlias:(NSString*)iAlias completion:(void(^)(NSInteger iResCode, NSString *iAlias, NSInteger seq))completion{///<删除别名
}
@end
