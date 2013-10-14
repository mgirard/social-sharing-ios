//
//  ViewController.m
//  SocialSharing
//
//  Created by Michael Girard on 10/14/13.
//  Copyright (c) 2013 Michael Girard. All rights reserved.
//

#import "ViewController.h"
#import <Social/Social.h>

@interface ViewController ()

@end

@implementation ViewController
@synthesize shareBtn, resultsLabel, inputText;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)shareButtonClick:(id)sender {
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        SLComposeViewController *vc = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        [vc setInitialText:inputText.text];
        [self presentViewController:vc animated:YES completion:nil];
    } else {
        NSLog(@"facebook is not configured");
    }
    
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

@end
