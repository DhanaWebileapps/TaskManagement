//
//  TMRemainderViewController.m
//  TaskManagement
//
//  Created by Kalluri, Satya (external - Project) on 9/16/13.
//  Copyright (c) 2013 Dhana Gadupooti. All rights reserved.
//

#import "TMRemainderViewController.h"

@interface TMRemainderViewController ()
{
    NSDateFormatter* dateFormatter;
    UIActionSheet *aac;
    NSMutableArray *titles;
    UIToolbar *pickerDateToolbar;
}

@end

@implementation TMRemainderViewController
@synthesize datePickerButton,repeatButton;

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
    titles = [[NSMutableArray alloc] initWithObjects:@"Once",@"Weekly",@"Monthly", nil];
    NSDate* currentDate = [NSDate date];
    dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"dd-MM-yyyy HH:mm";
    NSString *dateString = [dateFormatter stringFromDate:currentDate];
    [datePickerButton setTitle:dateString forState:UIControlStateNormal];
    aac = [[UIActionSheet alloc] initWithTitle:@"How many?"
                                      delegate:self
                             cancelButtonTitle:nil
                        destructiveButtonTitle:nil
                             otherButtonTitles:nil];
    pickerDateToolbar= [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];

}


- (IBAction)showDatePicker:(id)sender {
    
    aac = [[UIActionSheet alloc] initWithTitle:@"How many?"
                                                     delegate:self
                                            cancelButtonTitle:nil
                                       destructiveButtonTitle:nil
                                            otherButtonTitles:nil];
    
    UIDatePicker *theDatePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0.0, 44.0, 0.0, 0.0)];

    
  
    [theDatePicker addTarget:self action:@selector(dateChanged:)  forControlEvents:UIControlEventValueChanged];
    
    pickerDateToolbar.barStyle = UIBarStyleBlackOpaque;
    [pickerDateToolbar sizeToFit];
    
    NSMutableArray *barItems = [[NSMutableArray alloc] init];
    
    UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    [barItems addObject:flexSpace];
    
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(datePickerDoneClick)];
    [barItems addObject:doneBtn];
    
    [pickerDateToolbar setItems:barItems animated:YES];
    
    [aac addSubview:pickerDateToolbar];
    [aac addSubview:theDatePicker];
    [aac showInView:self.view];
    [aac setBounds:CGRectMake(0,0,320, 464)];
}

- (IBAction)repeatButtonAction:(id)sender
{
  

    UIPickerView *pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0.0, 44.0, 0.0, 0.0)];
    pickerView.delegate = self;
    pickerView.showsSelectionIndicator = YES;
  
    pickerDateToolbar.barStyle = UIBarStyleBlackOpaque;
    [pickerDateToolbar sizeToFit];
    
    NSMutableArray *barItems = [[NSMutableArray alloc] init];
    
    UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    [barItems addObject:flexSpace];
    
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(datePickerDoneClick)];
    [barItems addObject:doneBtn];
    
    [pickerDateToolbar setItems:barItems animated:YES];
    
    [aac addSubview:pickerDateToolbar];
    [aac addSubview:pickerView];
    [aac showInView:self.view];
    [aac setBounds:CGRectMake(0,0,320, 464)];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [titles objectAtIndex:row];
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow: (NSInteger)row inComponent:(NSInteger)component {
    [repeatButton setTitle:[titles objectAtIndex:row] forState:UIControlStateNormal];
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return titles.count;
}


-(void) datePickerDoneClick
{

    [aac dismissWithClickedButtonIndex:0 animated:YES];
}

-(void) dateChanged:(UIDatePicker *)sender {

    NSDate *currentDate = [NSDate date];
    NSComparisonResult result = [currentDate compare:sender.date];
    
    if (result == NSOrderedAscending) {
        [datePickerButton setTitle:[dateFormatter stringFromDate:sender.date] forState:UIControlStateNormal];
    }
    

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
