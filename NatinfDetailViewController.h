//
//  NatinfDetailViewController.h
//  NatinfList
//
//  Created by Pascal on 20/07/14.
//  Copyright (c) 2014 Pascal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NatinfClass.h"

@interface NatinfDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *labelQualification;
@property (weak, nonatomic) IBOutlet UILabel *labelClasse;
@property (weak, nonatomic) IBOutlet UILabel *labelAmende;
@property (weak, nonatomic) IBOutlet UILabel *labelAmendeMin;
@property (weak, nonatomic) IBOutlet UILabel *labelAmendeMaj;
@property (weak, nonatomic) IBOutlet UILabel *labelPoint;

@property (nonatomic, strong) NatinfClass *natinf;

@end
