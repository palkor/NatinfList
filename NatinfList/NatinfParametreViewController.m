//
//  NatinfParametreViewController.m
//  NatinfList
//
//  Created by Pascal on 21/07/14.
//  Copyright (c) 2014 Pascal. All rights reserved.
//

#import "NatinfParametreViewController.h"

@interface NatinfParametreViewController ()


@end

@implementation NatinfParametreViewController {
    
    NSUserDefaults *prefs;
    
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    prefs = [NSUserDefaults standardUserDefaults];
    
    if ([prefs boolForKey:@"modeRecherche"]) {
        [_mySwitch setOn:YES];
    } else {
        [_mySwitch setOn:NO];
    }
    
    if ([prefs boolForKey:@"vitesse"]) {
        [_switchVitesse setOn:YES];
    }else {
        [_switchVitesse setOn:NO];
    }
    
    if ([prefs boolForKey:@"stationnement"]) {
        [_switchStationnement setOn:YES];
    } else {
        [_switchStationnement setOn:NO];
    }
    
    if ([prefs boolForKey:@"autres"]) {
        [_switchAutres setOn:YES];
    } else {
        [_switchAutres setOn:NO];
    }
    
    [self.mySwitch addTarget:self action:@selector(stateChanged:) forControlEvents:UIControlEventValueChanged];
    [self.switchVitesse addTarget:self action:@selector(stateChanged1:) forControlEvents:UIControlEventValueChanged];
    [self.switchStationnement addTarget:self action:@selector(stateChanged2:) forControlEvents:UIControlEventValueChanged];
    [self.switchAutres addTarget:self action:@selector(stateChanged3:) forControlEvents:UIControlEventValueChanged];
    
    _labelCadre.layer.borderColor = [UIColor blackColor].CGColor;
    _labelCadre.layer.borderWidth = 1.0;
   
}

- (void)stateChanged:(UISwitch *) switchState {
   
    prefs = [NSUserDefaults standardUserDefaults];
    
    if ([switchState isOn]) {
        [prefs setBool:true forKey:@"modeRecherche"];
        
     
    } else {
        [prefs setBool:false forKey:@"modeRecherche"];
     
    }
    [prefs synchronize];
}

-(void)stateChanged1:(UISwitch *) switchState {
    if ([switchState isOn]) {
    prefs = [NSUserDefaults standardUserDefaults],
    [prefs setBool:true forKey:@"vitesse"];
    [prefs setBool:false forKey:@"stationnement"];
    [prefs setBool:false forKey:@"autres"];
    [_switchStationnement setOn:NO ];
    [_switchAutres setOn:NO];
        
    }else {
        [prefs setBool:false forKey:@"vitesse"];
    }
    [prefs synchronize];
}

-(void)stateChanged2:(UISwitch *) switchState {
    if ([switchState isOn]) {
        prefs = [NSUserDefaults standardUserDefaults],
        [prefs setBool:true forKey:@"stationnement"];
        [prefs setBool:false forKey:@"vitesse"];
        [prefs setBool:false forKey:@"autres"];
        [_switchVitesse setOn:NO];
        [_switchAutres setOn:NO];
        
    }else {
        [prefs setBool:false forKey:@"stationnement"];
    }
    [prefs synchronize];
}

-(void)stateChanged3:(UISwitch *) switchState {
    if ([switchState isOn]) {
        prefs = [NSUserDefaults standardUserDefaults],
        [prefs setBool:true forKey:@"autres"];
        [prefs setBool:false forKey:@"vitesse"];
        [prefs setBool:false forKey:@"stationnement"];
        [_switchVitesse setOn:NO];
        [_switchStationnement setOn:NO];
        
    }else {
        [prefs setBool:false forKey:@"autres"];
    }
    [prefs synchronize];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
