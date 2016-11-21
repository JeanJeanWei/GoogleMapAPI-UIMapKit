//
//  SampleViewController.m
//  CodingExercise1
//
//  Created by JJ WEI on 12-08-06.
//  Copyright (c) 2012 Ice Whale Inc. All rights reserved.
//

#import "SampleViewController.h"

@implementation SampleViewController
@synthesize address;
@synthesize description;
@synthesize tabAddressList;

- (void)viewDidLoad
{
    [super viewDidLoad];
    a.text = [LanguageManager stringForKey:@"address"];
    d.text = [LanguageManager stringForString:@"description"];
    l.text = [LanguageManager stringForString:@"List of addresses and descriptions"];
    btnAdd.titleLabel.text = [LanguageManager stringForKey:@"Add New Address"];
    btnEmail.titleLabel.text = [LanguageManager stringForKey:@"share email"];
    btnSMS.titleLabel.text = [LanguageManager stringForKey:@"share SMS"];
    [tabAddressList reloadData];

    /*** listen to if a new item added ***/
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(reLoadData)
     name:@"addNewItem"
     object:nil ]; 
}
- (void)reLoadData
{
    [tabAddressList reloadData];
    [spinner stopAnimating];
}
-(IBAction) tapBackground: (id) sender {
	[address resignFirstResponder];
    [description resignFirstResponder];
}

-(IBAction) goAwayKeyboard: (id) sender {
	[sender resignFirstResponder];
}
- (IBAction)addClicked
{
    NSString *ad = address.text;
    NSString *de = description.text;
    
    if (ad.length == 0) 
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:[LanguageManager stringForKey:@"Please enter the address."] message:@"" delegate:nil cancelButtonTitle:nil otherButtonTitles:[LanguageManager stringForKey:@"Dismiss"], nil];
        [alertView show];
        return;
    } 
    if (de.length == 0) 
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:[LanguageManager stringForKey:@"Please enter the description."] message:@"" delegate:nil cancelButtonTitle:nil otherButtonTitles:[LanguageManager stringForKey:@"Dismiss"], nil];
        [alertView show];
        return;
    }
    
    [AddressManager.instance addAddress:ad andDescription:de];
    [spinner startAnimating];
    [tabAddressList reloadData];
   
}

- (IBAction)emailClicked 
{
    if (AddressManager.instance.data.addressData.count == 0) 
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"" message:[LanguageManager stringForKey:@"Sorry, your address list is empty."] delegate:nil cancelButtonTitle:nil otherButtonTitles:[LanguageManager stringForKey:@"Close"], nil];
        [alertView show];
        
    } else {
        Class mailClass = (NSClassFromString(@"MFMailComposeViewController"));
        if (mailClass != nil)
        {
            // We must always check whether the current device is configured for sending emails
            if ([mailClass canSendMail])
            {
                [self displayComposerSheet];
            }
            else
            {
                [self launchMailAppOnDevice];
            }
        }
        else
        {
            [self launchMailAppOnDevice];
        }
    }
}
- (IBAction)smsClicked
{
    if (AddressManager.instance.data.addressData.count == 0) 
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"" message:[LanguageManager stringForKey:@"Sorry, your address list is empty."] delegate:nil cancelButtonTitle:nil otherButtonTitles:[LanguageManager stringForKey:@"Close"], nil];
        [alertView show];
    } 
    else 
    {
        MFMessageComposeViewController *controller = [MFMessageComposeViewController new];
        if([MFMessageComposeViewController canSendText])
        {
            NSMutableString *smsBody = [NSMutableString new];
            for (int i = 0; i<AddressManager.instance.data.addressData.count; i++) 
            {
                AddressModel *temp = [AddressManager.instance.data.addressData objectAtIndex:i];
                [smsBody appendFormat:@"<b>%@</b> - %@<br/><br/>",temp.description, temp.address];
            }
            controller.body = smsBody;    
            controller.recipients = [NSArray arrayWithObjects:@"+1-111-222-3333", @"111-333-4444", nil];
            controller.messageComposeDelegate = self;
            [self presentModalViewController:controller animated:YES];
        }    
        
    }
}
#pragma mark Table view delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView 
{
    return 1;
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
    // return 1;
   
    return AddressManager.instance.data.addressData.count;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    static NSString *CellIdentifier = @"CustomCell";
    
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) 
    {
        NSArray *topLevelObjects;
        
        topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"CustomCell" owner:nil options:nil];
        
        for (id currentObject in topLevelObjects) 
        {
            if ([currentObject isKindOfClass:[UITableViewCell class]]) 
            {
                cell = (CustomCell*) currentObject;
            }
        }
    }
    // Set up the cell...
    
    cell.delegate = self;
    int index = indexPath.row;
    AddressModel *temp =  [AddressManager.instance.data.addressData objectAtIndex:index];
    cell.address.text = temp.address;
    cell.description.text = temp.description;
    cell.idx = index;
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
    NSLog(@"selected row = %d",indexPath.row);    
}


#pragma mark CustomCell delegate
- (void)CustomCellDeleteClicked
{
    [tabAddressList reloadData];
}

#pragma mark -
#pragma mark Compose Mail

// Displays an email composition interface inside the application. Populates all the Mail fields. 
-(void)displayComposerSheet 
{
	MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
	picker.mailComposeDelegate = self;
	[picker setSubject:@"Address List!"];
	
	// Set up recipients
    [picker setToRecipients:[NSArray arrayWithObject:@""]]; 
    
	// Fill out the email body text
    NSMutableString *emailBody = [NSMutableString new];
    for (int i = 0; i<AddressManager.instance.data.addressData.count; i++) 
    {
        AddressModel *temp = [AddressManager.instance.data.addressData objectAtIndex:i];
        [emailBody appendFormat:@"<b>%@</b> - %@<br/><br/>",temp.description, temp.address];
    }
    
    [picker setMessageBody:emailBody isHTML:YES];
	[self presentModalViewController:picker animated:YES];
}


// Dismisses the email composition interface when users tap Cancel or Send. Proceeds to update the message field with the result of the operation.
- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error 
{	
	// Notifies users about errors associated with the interface
	switch (result)
	{
		case MFMailComposeResultCancelled:
			NSLog(@"Result: canceled");
			break;
		case MFMailComposeResultSaved:
			NSLog(@"Result: saved");
			break;
            
		case MFMailComposeResultSent:
			NSLog(@"Result: sent");
			break;
            
		case MFMailComposeResultFailed:
			NSLog(@"Result: failed");
			break;
		default:
			NSLog(@"Result: not sent");
			break;
	}
	[self dismissModalViewControllerAnimated:YES];
}


#pragma mark -
#pragma mark Workaround

// Launches the Mail application on the device.
-(void)launchMailAppOnDevice
{
	NSString *recipients = @"mailto:&subject=Address List";
    NSMutableString *emailBody = [[NSMutableString alloc] initWithFormat:@"&body="];
	if (AddressManager.instance.data.addressData.count>0) 
    {
        for (int i = 0; i<AddressManager.instance.data.addressData.count; i++) 
        {
            AddressModel *temp = [AddressManager.instance.data.addressData objectAtIndex:i];
            [emailBody appendFormat:@"<b>%@</b> - %@<br/><br/>",temp.description, temp.address];
        }
    }
    
    NSString *email = [NSString stringWithFormat:@"%@%@", recipients, emailBody];
	email = [email stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:email]];
}

#pragma mark -
#pragma mark SMS delegate
- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
    [self dismissModalViewControllerAnimated:YES];
    
    if (result == MessageComposeResultCancelled)
        NSLog(@"Message cancelled");
    else if (result == MessageComposeResultSent)
        NSLog(@"Message sent");  
    else 
        NSLog(@"Message failed");  
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
   // return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    return YES;
}

@end
