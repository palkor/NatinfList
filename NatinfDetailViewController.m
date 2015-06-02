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
    NSString *categorie = [NSString stringWithFormat:@"%@", self.natinf.categorieInfractionClass];
    
    if ([categorie  isEqual: @"Stationnement"]) {
        
        UIImage *image = [UIImage imageNamed:@"stationnement.gif" inBundle:nil compatibleWithTraitCollection:nil];
         _imgView.image = image;
    
    }
    else if ([categorie isEqual:@"Autre"]) {
        
        UIImage *image = [UIImage imageNamed:@"autre.png" inBundle:nil compatibleWithTraitCollection:nil];
        _imgView.image = image;
        
    }
    
    else {
        
        UIImage *image = [UIImage imageNamed:@"vitesse.gif" inBundle:nil compatibleWithTraitCollection:nil];
        _imgView.image = image;
    }
    
   
   
    _labelQualification.layer.borderColor = [UIColor colorWithRed:0.024f green:0.478f blue:0.710f alpha:1.00f].CGColor;
    _labelQualification.layer.borderWidth = 1.0;
    
    _labelClasse.layer.borderColor = [UIColor colorWithRed:0.024f green:0.478f blue:0.710f alpha:1.00f].CGColor;
    _labelClasse.layer.borderWidth = 1.0;
    
    _labelAmende.layer.borderColor = [UIColor colorWithRed:0.024f green:0.478f blue:0.710f alpha:1.00f].CGColor;
    _labelAmende.layer.borderWidth = 1.0;
    
    _labelAmendeMin.layer.borderColor = [UIColor colorWithRed:0.024f green:0.478f blue:0.710f alpha:1.00f].CGColor;
    _labelAmendeMin.layer.borderWidth = 1.0;
    
    _labelAmendeMaj.layer.borderColor = [UIColor colorWithRed:0.024f green:0.478f blue:0.710f alpha:1.00f].CGColor;
    _labelAmendeMaj.layer.borderWidth = 1.0;
    
    _labelNatinf.layer.borderColor = [UIColor redColor].CGColor;
    _labelNatinf.layer.borderWidth = 1.0;
    
    _labelPoint.layer.borderColor = [UIColor colorWithRed:0.024f green:0.478f blue:0.710f alpha:1.00f].CGColor;
    _labelPoint.layer.borderWidth = 1.0;
   
   
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
