//
//  QQPushManager.m
//  QQPushManager_Example
//
//  Created by 魏国强 on 2018/10/15.
//  Copyright © 2018 魏国强. All rights reserved.
//
#import <JPush/JPUSHService.h>
#import "QQPushManager.h"
@interface QQPushManager ()
@property(nonatomic,strong)NSMutableDictionary            *moduleList;
@end
@implementation QQPushManager
+ (void)load{
    [[NSNotificationCenter defaultCenter] addObserverForName:nil object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
        NSLog(@"%@:%@",note.name,note.object);
    }];
}
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
  
    
    

}
+ (void)registerModule:(NSString*)module event:(void(^)(NSDictionary *userInfo))event{ ///<注册模块 拦截推送点击事件
    NSAssert(module&&event, @"注册服务失败：module:%@,event:%@",module,event);
    [[QQPushManager  sharedManager].moduleList setObject:event forKey:module];
}
+ (void)destroyModule:(NSString*)module  {///<销毁模块 取消拦截推送点击事件
    [[QQPushManager  sharedManager].moduleList removeObjectForKey:module];
}
+ (void)destroyAllModule{
    [[QQPushManager  sharedManager].moduleList removeAllObjects];
}
+ (void)addTag:(NSSet*)tags completion:(void(^)(NSInteger iResCode, NSSet *iTags, NSInteger seq))completion seq:(NSInteger)seq{ ///<添加标签
    [JPUSHService setTags:tags completion:completion seq:seq];
}
+ (void)deleteTag:(NSSet*)tags completion:(void(^)(NSInteger iResCode, NSSet *iTags, NSInteger seq))completion seq:(NSInteger)seq{///<删除标签
    [JPUSHService deleteTags:tags completion:completion seq:seq];
}
+ (void)addAlia:(NSString*)iAlias completion:(void(^)(NSInteger iResCode, NSString *iAlias, NSInteger seq))completion seq:(NSInteger)seq{///<添加别名
    [JPUSHService setAlias:iAlias completion:completion seq:seq];
}
+ (void)deleteAlias:(void(^)(NSInteger iResCode, NSString *iAlias, NSInteger seq))completion seq:(NSInteger)seq{///<删除别名
    [JPUSHService deleteAlias:completion seq:seq];
}
- (NSMutableDictionary *)moduleList{
    if (!_moduleList) {
        _moduleList = [NSMutableDictionary dictionary];
    }
    return _moduleList;
}
@end
