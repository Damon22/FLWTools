//
//  UITableViewCell+Extension.h
//  TableViewDemo
//
//  Created by pkxing on 15/1/31.
//  Copyright (c) 2015年 梦醒. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (MXExtension)
+(instancetype)cellWithTableView:(UITableView *)tableView identifier:(NSString *)identifier style:(UITableViewCellStyle)style;
@end
