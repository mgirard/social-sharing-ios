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

@property (nonatomic, strong) UIImage *theImage;

@end

@implementation ViewController
@synthesize shareBtn, resultsLabel, inputText, imageView, theImage;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(takePicture:)];
	[self.imageView addGestureRecognizer:tapRecognizer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)shareButtonClick:(id)sender {
	NSArray *items = nil;
	if (theImage) {
		items = @[theImage, inputText.text];
	} else {
		items = @[inputText.text];
	}
    UIActivityViewController *shareVc = [[UIActivityViewController alloc] initWithActivityItems:items applicationActivities:nil];
    [shareVc setCompletionHandler:^(NSString *activityType, BOOL completed) {
		NSString *outString = [NSString stringWithFormat:@"completed is %d, sharing type is... %@", completed, activityType];
        resultsLabel.text = outString;
		if (completed) {
			inputText.text = @"";
		}
    }];
    [self presentViewController:shareVc animated:YES completion:nil];
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void) takePicture:(UITapGestureRecognizer *)tapRecognizer {
	UIImagePickerController *imageController = [[UIImagePickerController alloc] init];
    [imageController setDelegate:self];
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        [imageController setSourceType:UIImagePickerControllerSourceTypeCamera];
    } else {
        [imageController setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    }
    [self presentViewController:imageController animated:YES completion:nil];
}

- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *inputImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    if (inputImage) {
        theImage = inputImage;
		[self refreshUI];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) refreshUI {
    if (theImage) {
        imageView.image = theImage;
    }
}

- (IBAction)capturePhoto:(id)sender {
	[self takePicture:nil];
}

@end
