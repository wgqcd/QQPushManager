//
//  QQPushManager.h
//  QQPushManager_Example
//
//  Created by 魏国强 on 2018/10/15.
//  Copyright © 2018 魏国强. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QQPushManager : NSObject
//+ (instancetype)sharedManager;
+ (void)registerService:(NSString *)appKey; ///<注册服务
+ (void)registerModule:(NSString*)module event:(void(^)(NSDictionary *userInfo))event; ///<注册模块 拦截推送点击事件
+ (void)destroyModule:(NSString*)module ; ///<销毁模块 取消拦截推送点击事件
+ (void)destroyAllModule ; ///<销毁模块 取消所有拦截推送点击事件
+ (void)addTag:(NSSet*)tags completion:(void(^)(NSInteger iResCode, NSSet *iTags, NSInteger seq))completion seq:(NSInteger)seq; ///<添加标签
+ (void)deleteTag:(NSSet*)tags completion:(void(^)(NSInteger iResCode, NSSet *iTags, NSInteger seq))completion seq:(NSInteger)seq;///<删除标签
+ (void)addAlia:(NSString*)iAlias completion:(void(^)(NSInteger iResCode, NSString *iAlias, NSInteger seq))completion seq:(NSInteger)seq;///<添加别名
+ (void)deleteAlias:(void(^)(NSInteger iResCode, NSString *iAlias, NSInteger seq))completion seq:(NSInteger)seq;///<删除别名
@end

NS_ASSUME_NONNULL_END
