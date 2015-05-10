//
//  CustomeCell.h
//  NatinfList
//
//  Created by Pascal Ormancey on 02/05/2015.
//  Copyright (c) 2015 Pascal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomeCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *libelleInfraction;
@property (weak, nonatomic) IBOutlet UILabel *natinfInfraction;
@property (weak, nonatomic) IBOutlet UILabel *categorieInfraction;

@end
