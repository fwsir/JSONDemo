//
//  CinemaModel.h
//  JSONDemo
//
//  Created by BOOM on 16/4/12.
//  Copyright © 2016年 DEVIL. All rights reserved.
//

#import "JSONToModel.h"
#import <UIKit/UIKit.h>

@interface CinemaModel : JSONToModel

@property (nonatomic, copy) NSString *address;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *circleName;
@property (nonatomic, strong) NSNumber *distance;

@end
