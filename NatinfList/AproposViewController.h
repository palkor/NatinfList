//
//  AproposViewController.h
//  NatinfList
//
//  Created by Pascal on 27/07/2014.
//  Copyright (c) 2014 Pascal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface AproposViewController : UIViewController <MFMailComposeViewControllerDelegate>
- (IBAction)sendMail:(id)sender;

@end
