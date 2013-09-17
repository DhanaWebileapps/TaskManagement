//
//  TMFolderViewController.m
//  TaskManagement
//
//  Created by Kalluri, Satya (external - Project) on 9/17/13.
//  Copyright (c) 2013 Dhana Gadupooti. All rights reserved.
//

#import "TMFolderViewController.h"

@interface TMFolderViewController ()

@end

@implementation TMFolderViewController
@synthesize folderArray,folderTableView;

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
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addFolder)];
    self.navigationItem.rightBarButtonItem = addButton;
    self.title = @"Folders";
    folderArray = [[NSMutableArray alloc] init];
}

-(void) addFolder{
    UIAlertView *av = [[UIAlertView alloc]initWithTitle:@"New Folder" message:@"Please enter the name of the folder" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    av.alertViewStyle = UIAlertViewStylePlainTextInput;
    [av show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    //    NSLog(@"%@", [alertView textFieldAtIndex:0].text);
    NSString *folderName = [alertView textFieldAtIndex:0].text;
    [folderArray addObject:folderName];
    [folderTableView reloadData];
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return folderArray.count;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
    }
    cell.textLabel.text = [folderArray objectAtIndex:indexPath.row];
    return cell;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
