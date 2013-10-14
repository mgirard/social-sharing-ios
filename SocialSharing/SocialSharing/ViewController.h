//
//  ViewController.h
//  SocialSharing
//
//  Created by Michael Girard on 10/14/13.
//  Copyright (c) 2013 Michael Girard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate>

@property (nonatomic, strong) IBOutlet UIButton *shareBtn;
@property (nonatomic, strong) IBOutlet UILabel *resultsLabel;
@property (nonatomic, strong) IBOutlet UITextField *inputText;
@property (nonatomic, strong) IBOutlet UIImageView *imageView;

- (IBAction)shareButtonClick:(id)sender;
- (IBAction)capturePhoto:(id)sender;

@end
