//
//  AproposViewController.m
//  NatinfList
//
//  Created by Pascal on 27/07/2014.
//  Copyright (c) 2014 Pascal. All rights reserved.
//

#import "AproposViewController.h"
#import <QuartzCore/QuartzCore.h>


@interface AproposViewController ()

@end

@implementation AproposViewController

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
    
    _viewBackLabel.layer.borderColor = [UIColor colorWithRed:0.024f green:0.478f blue:0.710f alpha:1.00f].CGColor;
    _viewBackLabel.layer.borderWidth = 3.0;
  
    
   // _labelApropos.layer.borderColor =[UIColor colorWithRed:0.024f green:0.478f blue:0.710f alpha:1.00f].CGColor;
   // _labelApropos.layer.borderWidth = 3.0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
   }



- (IBAction)sendMail:(id)sender {
    if ([MFMailComposeViewController canSendMail]) {
        
    
    
    
    NSString *emailTitre = @"Commentaire sur l'application NatinfList";
    NSString *messageBody = @"Mettre ici votre commentaire sur l'application";
    NSArray *destinataires = [NSArray arrayWithObject:@"palkor@hotmail.fr"];
    
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc]init];
    mc.mailComposeDelegate = self;
    [mc.navigationBar setTintColor:[UIColor whiteColor]];
    
    [mc setSubject:emailTitre];
    [mc setMessageBody:messageBody isHTML:NO];
    [mc setToRecipients:destinataires];
    
    [self presentViewController:mc animated:YES completion:NULL];
    } else {
       
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Erreur"
                                                        message:@"Votre appareil ne supporte pas l'envoi de mail"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles: nil];
        [alert show];
        
        
        }


}

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    int message = 0;
    switch (result) {
        case MFMailComposeResultCancelled:
            message = 1;
            break;
        case MFMailComposeResultSaved:
            message = 2;
            break;
        case MFMailComposeResultSent:
            message = 3;
            break;
        case MFMailComposeResultFailed:
            message = 4;
            break;
        default:
            break;
    }
   
    
    [self dismissViewControllerAnimated:YES completion:NULL];
    
    NSString *messageInformation = nil;
    switch (message) {
        case 1:
            messageInformation = @"L'envoi a été annulé";
            break;
        case 2:
            messageInformation = @"Le message a été sauvegardé";
            break;
        case 3:
            messageInformation = @"Message envoyé";
            break;
        case 4:
            break;
            messageInformation = @"Une erreur est survenue lors de l'envoi";
        default:
            break;
    }
    
    UIAlertView *messageAlert = [[UIAlertView alloc]initWithTitle:@"Envoi message" message:messageInformation delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [messageAlert show];
    
}



@end
