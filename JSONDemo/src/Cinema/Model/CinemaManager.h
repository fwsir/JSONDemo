//
//  CinemaManager.h
//  JSONDemo
//
//  Created by BOOM on 16/4/12.
//  Copyright © 2016年 DEVIL. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^CinemaBlock)(NSArray *result);

@interface CinemaManager : NSObject

@property (nonatomic, copy) CinemaBlock cinemaBlock;

- (void)getCinemaListWithBlock:(CinemaBlock)block;

@end
