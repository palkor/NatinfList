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

@implementation NatinfParametreViewController

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

    [self.mySwitch addTarget:self action:@selector(stateChanged:) forControlEvents:UIControlEventValueChanged];
}

- (void)stateChanged:(UISwitch *) switchState {
    NSUserDefaults *prefs;
    prefs = [NSUserDefaults standardUserDefaults];
    
    
    if ([switchState isOn]) {
        [prefs setBool:true forKey:@"modeRecherche"];
        NSLog(@"Le bouton est activé");
    } else {
        [prefs setBool:false forKey:@"modeRecherche"];
        NSLog(@"Le bouton est désactivé");
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
