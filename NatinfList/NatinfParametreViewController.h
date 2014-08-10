//
//  NatinfParametreViewController.h
//  NatinfList
//
//  Created by Pascal on 21/07/14.
//  Copyright (c) 2014 Pascal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NatinfParametreViewController : UIViewController

@property (weak, nonatomic) IBOutlet UISwitch *mySwitch;
@property (weak, nonatomic) IBOutlet UILabel *labelCadre;
@property (weak, nonatomic) IBOutlet UISwitch *switchVitesse;
@property (weak, nonatomic) IBOutlet UISwitch *switchStationnement;

@property (weak, nonatomic) IBOutlet UISwitch *switchAutres;
@end
