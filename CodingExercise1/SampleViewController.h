//
//  SampleViewController.h
//  CodingExercise1
//
//  Created by JJ WEI on 12-08-06.
//  Copyright (c) 2012 Ice Whale Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>

#import "CustomCell.h"
#import "GeoManager.h"
#import "AddressManager.h"
@interface SampleViewController : UIViewController <CustomCellDelegate, MFMailComposeViewControllerDelegate, MFMessageComposeViewControllerDelegate>
{
    IBOutlet UILabel* a;
    IBOutlet UILabel* d;
    IBOutlet UILabel* l;
    
    IBOutlet UITableView *tabAddressList;
    IBOutlet UITextField *address;
    IBOutlet UITextField *description;
    IBOutlet UIButton *btnAdd;
    IBOutlet UIButton *btnEmail;
    IBOutlet UIButton *btnSMS;
    IBOutlet UIActivityIndicatorView *spinner;
    
}

@property IBOutlet UITextField *address;
@property IBOutlet UITextField *description;
@property IBOutlet UITableView *tabAddressList;

- (IBAction)addClicked;
- (IBAction)tapBackground: (id) sender ;
- (IBAction)goAwayKeyboard: (id) sender;
- (IBAction)emailClicked;
- (IBAction)smsClicked;
@end
