//
//  CinemaManager.m
//  JSONDemo
//
//  Created by BOOM on 16/4/12.
//  Copyright © 2016年 DEVIL. All rights reserved.
//

#import "CinemaManager.h"
#import "CinemaModel.h"

@implementation CinemaManager

- (void)getCinemaListWithBlock:(CinemaBlock)block {
    
    if (!self.cinemaBlock) {
        self.cinemaBlock = block;
        
        // JSON序列化
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"CinemaList" ofType:@"json"];
        NSData *data = [NSData dataWithContentsOfFile:filePath];
        NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSArray *list = result[@"cinemaList"];
        
        // 对获取到的数据进行持久性处理
        NSMutableArray *resultArray = [NSMutableArray array];
        [list enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            CinemaModel *model = [CinemaModel objcWithDict:obj mapDict:nil];
            [resultArray addObject:model];
        }];
        
        self.cinemaBlock(resultArray);
    }
}

@end
