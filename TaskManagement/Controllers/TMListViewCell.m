//
//  TMListViewCell.m
//  TaskManagement
//
//  Created by Dhana Gadupooti on 16/09/13.
//  Copyright (c) 2013 Dhana Gadupooti. All rights reserved.
//

#import "TMListViewCell.h"

@implementation TMListViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
