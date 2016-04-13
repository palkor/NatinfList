//
//  CalculetteViewController.m
//  Memento PVe
//
//  Created by Pascal Ormancey on 05/06/2015.
//  Copyright (c) 2015 Pascal. All rights reserved.
//
// Calculette radar

#import "CalculetteViewController.h"

@interface CalculetteViewController ()

@end

@implementation CalculetteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSUserDefaults *defaults;
    defaults = [NSUserDefaults standardUserDefaults];
    NSNumber *label = [defaults objectForKey:@"vitesse"];
    _labelVitesseLimite.text = [label stringValue];
    
    [_slider setThumbImage:[UIImage imageNamed:@"slider_tab.png"]
                      forState:UIControlStateNormal];
    [_slider setThumbImage:[UIImage imageNamed:@"slider_tab.png"]
                      forState:UIControlStateHighlighted];
    _slider.value = [label integerValue];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


-(void)calculRetraitPoint {
    
    
    NSUserDefaults *prefs;
    prefs = [NSUserDefaults standardUserDefaults];
    _vitesseLimite = (int)[prefs integerForKey:@"vitesse"];
    
    
    int i = _vitesseLimite;
    int deltaVitesse = _vitesseRetenu - i ;
    NSLog(@"différence %d", deltaVitesse);
    
    
    if (deltaVitesse < 20 && deltaVitesse >= 1) {
        
        _retraitPoint.text = @"1 point";
        
    }
    else if (deltaVitesse >= 20 && deltaVitesse <= 29) {
        _retraitPoint.text = @"2 points";
    }
    
    else if (deltaVitesse >= 30 && deltaVitesse <= 39) {
        _retraitPoint.text = @"3 points";
    }
    
    else if (deltaVitesse >= 40 && deltaVitesse <= 49) {
        _retraitPoint.text = @"4 points";
    }
    
    else if (deltaVitesse >= 50) {
        _retraitPoint.text = @"6 points";
    }
    
    else if (deltaVitesse <= 0) {
        _retraitPoint.text = @"0 point";
    }
    
    else {
        _retraitPoint.text = @"Erreur";
    }
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSString *resultatString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    NSScanner *scan = [NSScanner scannerWithString:resultatString];
    [scan scanInt:NULL];
    return [scan isAtEnd];
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //hides keyboard when another part of layout was touched
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}


- (IBAction)changeValeur {
    
    //int retenue;
    NSString *textVitesseEnregistre = self.textVitesseEnregistre.text;
    self.vitesseEnregistre = [textVitesseEnregistre intValue];
    
    if (self.vitesseEnregistre > 100) {
        self.vitesseRetenu = (self.vitesseEnregistre - ((self.vitesseEnregistre * 5)/100));
        
    }
    else {
        
        self.vitesseRetenu = self.vitesseEnregistre- 5;
        
    }
    
    NSString *textVitesseRetenue = [[NSString alloc] initWithFormat:@"%i", self.vitesseRetenu];
    if (_vitesseRetenu < 5) {
        _textVitesseRetenu.text = 0;
    }
    
    else {
        _textVitesseRetenu.text = textVitesseRetenue;
    }
    [self calculRetraitPoint];
    

}

- (IBAction)valueChange:(id)sender {
    UISlider *valueSlider= (UISlider *) sender;
    [valueSlider setContinuous:NO];
    NSInteger val = lround(valueSlider.value);
    _labelVitesseLimite.text = [NSString stringWithFormat:@"%i", (int)val];
    [self enregistreValeurVitesse:(int)val];
    
   }

-(void)enregistreValeurVitesse :(int)val {
    
    NSUserDefaults *prefs;
    prefs = [NSUserDefaults standardUserDefaults];
    [prefs setInteger:val forKey:@"vitesse"];
    [prefs synchronize];
    
    
}
@end
