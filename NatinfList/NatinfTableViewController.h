//
//  NatinfTableViewController.h
//  NatinfList
//
//  Created by Pascal on 18/07/14.
//  Copyright (c) 2014 Pascal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NatinfTableViewController : UITableViewController

@property (assign) BOOL valueSwitch;
@property (assign) BOOL valueSwitchVitesse;
@property (assign) BOOL valueSwitchStationnement;
@property (assign) BOOL valueSwitchAutres;

-(void)loadPrefUser;
-(void)stateSwitch:(int)nmrSwitch;

@end
