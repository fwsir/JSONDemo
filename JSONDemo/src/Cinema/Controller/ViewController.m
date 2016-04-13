//
//  ViewController.m
//  JSONDemo
//
//  Created by BOOM on 16/4/10.
//  Copyright © 2016年 DEVIL. All rights reserved.
//

#import "ViewController.h"
#import "CinemaManager.h"
#import "CinemaModel.h"
#import "CinemaTableViewCell.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) CinemaManager *manager;
@property (nonatomic, copy) NSArray *dataSource;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.manager = [[CinemaManager alloc] init];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([CinemaTableViewCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([CinemaTableViewCell class])];
    
    __weak typeof(self) weakSelf = self;
    [self.manager getCinemaListWithBlock:^(NSArray *result) {
        
        __strong typeof(self) strongSelf = weakSelf;
        strongSelf.dataSource = result;
        dispatch_async(dispatch_get_main_queue(), ^{
            
        });
    }];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CinemaTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CinemaTableViewCell class]) forIndexPath:indexPath];
    
    CinemaModel *model = self.dataSource[indexPath.row];
    cell.cinemaName.text = model.name;
    cell.circleName.text = model.circleName;
    cell.address.text = model.address;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
