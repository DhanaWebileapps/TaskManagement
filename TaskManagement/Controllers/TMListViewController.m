//
//  TMListViewController.m
//  TaskManagement
//
//  Created by Dhana Gadupooti on 16/09/13.
//  Copyright (c) 2013 Dhana Gadupooti. All rights reserved.
//

#import "TMListViewController.h"

@interface TMListViewController ()
{
    NSInteger rows;
}

@end

@implementation TMListViewController
@synthesize taskListFooterView;
@synthesize headerView;
@synthesize headerLabel;
@synthesize taskListTableView;

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
    self.title = @"TaskList";
    rows = 1;
    self.taskListFooterView.hidden = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma UITableView Datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return rows;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                 initWithStyle:UITableViewCellStyleDefault
                 reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = @"Add New Task Event";
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
   // [tableView setEditing:YES animated:YES];
    return cell;
}

#pragma UITableView Delegate
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    headerLabel.text = @"Default";
    return headerView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == rows-1)
    {
        rows++;
        self.taskListTableView.scrollEnabled = YES;
        [[self taskListTableView] reloadData];
    }
    else
    {
        
    }
  
    
}
@end
