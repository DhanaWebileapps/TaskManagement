//
//  TMRemainderViewController.h
//  TaskManagement
//
//  Created by Kalluri, Satya (external - Project) on 9/16/13.
//  Copyright (c) 2013 Dhana Gadupooti. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TMRemainderViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *datePickerButton;
- (IBAction)showDatePicker:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *repeatButton;
- (IBAction)repeatButtonAction:(id)sender;

@end
