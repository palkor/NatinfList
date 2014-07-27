//
//  NatinfDetailViewController.m
//  NatinfList
//
//  Created by Pascal on 20/07/14.
//  Copyright (c) 2014 Pascal. All rights reserved.
//

#import "NatinfDetailViewController.h"

@interface NatinfDetailViewController ()

@end

@implementation NatinfDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    self.labelNatinf.text = [NSString stringWithFormat:@"%@" ,self.natinf.natinfInfractionClass];
    self.labelQualification.text = self.natinf.libelleInfractionClass;
    self.labelClasse.text = [NSString stringWithFormat:@"%@", self.natinf.classeInfraction];
    self.labelAmende.text = [NSString stringWithFormat:@"%@",self.natinf.montantAmende];
    self.labelAmendeMin.text = [NSString stringWithFormat:@"%@", self.natinf.montantMinore];
    self.labelAmendeMaj.text = [NSString stringWithFormat:@"%@", self.natinf.montantMajore];
    self.labelPoint.text = [NSString stringWithFormat:@"%@", self.natinf.retraitPoint];
   
   
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
