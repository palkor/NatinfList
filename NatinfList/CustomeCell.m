//
//  CustomeCell.m
//  NatinfList
//
//  Created by Pascal on 18/07/14.
//  Copyright (c) 2014 Pascal. All rights reserved.
//

#import "CustomeCell.h"

@implementation CustomeCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
