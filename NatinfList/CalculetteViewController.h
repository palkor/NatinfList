//
//  CalculetteViewController.h
//  Memento PVe
//
//  Created by Pascal Ormancey on 05/06/2015.
//  Copyright (c) 2015 Pascal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalculetteViewController : UIViewController <UITextFieldDelegate>



@property (weak, nonatomic) IBOutlet UITextField *textVitesseEnregistre;
@property (weak, nonatomic) IBOutlet UILabel *retraitPoint;
@property (weak, nonatomic) IBOutlet UILabel *textVitesseRetenu;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *labelVitesseLimite;


@property (assign, nonatomic) int vitesseRetenu;
@property (assign, nonatomic) int vitesseEnregistre;
@property (assign, nonatomic) int vitesseLimite;

- (IBAction)changeValeur;

- (IBAction)valueChange:(id)sender;



@end
