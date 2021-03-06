//
//  JSONToModel.m
//  JSONDemo
//
//  Created by BOOM on 16/4/10.
//  Copyright © 2016年 DEVIL. All rights reserved.
//

#import "JSONToModel.h"
#import <objc/runtime.h>

@implementation JSONToModel

+ (instancetype)objcWithDict:(NSDictionary *)dict mapDict:(NSDictionary *)mapDict {
    id objc = [[self alloc] init];
    
    // 遍历模型中成员变量
    unsigned int outCount = 0;
    Ivar *ivars = class_copyIvarList(self, &outCount);
    
    for (int i = 0; i < outCount; ++i) {
        Ivar ivar = ivars[i];
        
        // 成员变量名称
        NSString *ivarName = @(ivar_getName(ivar));
        
        // 只对类型为对象类型的属性起作用
        /**
         *  成员变量的类型名称
         *  获取出来的成员变量类型名是@"\"...\"";
         *  需要截掉前面的@",和后面的"
         */
        NSString *ivarTypeName = @(ivar_getTypeEncoding(ivar));
        ivarTypeName = [ivarTypeName substringWithRange:NSMakeRange(2, ivarTypeName.length-3)];
        
        // 获取出来的是"_"开头的成员变量名,需要截取"_"之后的字符串
        ivarName = [ivarName substringFromIndex:1];
        
        id value = dict[ivarName];
        // 由外界通知内部，模型中成员变量名对应字典里面的哪个key
        if (!value) {
            if (mapDict) {
                NSString *keyName = mapDict[ivarName];
                value = dict[keyName];
            }
        }
        
        // 判空
        if (([value isKindOfClass:[NSNull class]] || !value) && [ivarTypeName isEqualToString:@"NSNumber"]) {
            value = @(0);
        }
        if ([value isKindOfClass:[NSNull class]]) {
            value = nil;
        }
        
        [objc setValue:value forKey:ivarName];
    }
    
    return objc;
}

@end
