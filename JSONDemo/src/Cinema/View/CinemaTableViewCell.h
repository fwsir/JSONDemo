//
//  CinemaTableViewCell.h
//  JSONDemo
//
//  Created by BOOM on 16/4/12.
//  Copyright © 2016年 DEVIL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CinemaTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *cinemaName;
@property (weak, nonatomic) IBOutlet UILabel *circleName;
@property (weak, nonatomic) IBOutlet UILabel *address;

@end
