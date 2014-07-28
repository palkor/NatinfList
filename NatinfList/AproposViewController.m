//
//  AproposViewController.m
//  NatinfList
//
//  Created by Pascal on 27/07/2014.
//  Copyright (c) 2014 Pascal. All rights reserved.
//

#import "AproposViewController.h"


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
    // Do any additional setup after loading the view.
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

- (IBAction)sendMail:(id)sender {
    NSString *emailTitre = @"test email";
    NSString *messageBody = @"Ceci est un essai de message";
    NSArray *destinataires = [NSArray arrayWithObject:@"palkor@hotmail.fr"];
    
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc]init];
    mc.mailComposeDelegate = self;
    [mc setSubject:emailTitre];
    [mc setMessageBody:messageBody isHTML:NO];
    [mc setToRecipients:destinataires];
    
    [self presentViewController:mc animated:YES completion:NULL];
}

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    
    switch (result) {
        case MFMailComposeResultCancelled:
            NSLog(@"Email annulé");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Email sauvegardé");
        case MFMailComposeResultSent:
            NSLog(@"Email envoyé");
        case MFMailComposeResultFailed:
            NSLog(@"Erreur lors de l'envoi");
        default:
            break;
    }
    
     [self dismissViewControllerAnimated:YES completion:NULL];
    
    
}
@end
