//
//  TMListViewController.m
//  TaskManagement
//
//  Created by Dhana Gadupooti on 16/09/13.
//  Copyright (c) 2013 Dhana Gadupooti. All rights reserved.
//

#import "TMListViewController.h"
#import "TMListViewCell.h"
#import "TMAddCustomTaskManagementCell.h"
#import "TMAddExpandCustomTaskManagementCell.h"


#define CELL_IDENTIFIER @"Cell"
#define ADD_CELL_IDENTIFIER @"AddCell"
#define  ADD_TASK_CELL_NIB @"TMListViewCell"

@interface TMListViewController ()
{
    NSInteger rows;
    NSMutableArray *tableViewCellslist;
    NSDictionary *selectedDict;
    NSInteger replaceIndex;

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
        tableViewCellslist = [[NSMutableArray alloc] init];
        selectedDict = [[NSDictionary alloc] init];
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
    return tableViewCellslist.count+rows;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    
   
    if (tableViewCellslist.count == 0)
    {
        static NSString *cellIdentifier=CELL_IDENTIFIER;
        
        TMListViewCell *cell=(TMListViewCell*)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if(cell==nil)
        {
            
            NSArray *nib=[[UINib nibWithNibName:ADD_TASK_CELL_NIB bundle:nil] instantiateWithOwner:self options:nil];
            
            cell=(TMListViewCell*)[nib objectAtIndex:0];
        }
        [cell.addNewTaskLabel setText:@"Add New Task"];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        return cell;
    }
    else
    {
        if (indexPath.row == tableViewCellslist.count)
        {
            static NSString *cellIdentifier=CELL_IDENTIFIER;
            
            TMListViewCell *cell=(TMListViewCell*)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
            if(cell==nil)
            {
                
                NSArray *nib=[[UINib nibWithNibName:ADD_TASK_CELL_NIB bundle:nil] instantiateWithOwner:self options:nil];
                
                cell=(TMListViewCell*)[nib objectAtIndex:0];
            }
            [cell.addNewTaskLabel setText:@"Add New Task"];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            return cell;

        }
        else
        {
            NSDictionary *dict =[tableViewCellslist objectAtIndex:indexPath.row];
            NSString *string = [dict objectForKey:@"cell"];
            if ([string isEqualToString:@"AddCell"])
            {
                TMAddCustomTaskManagementCell *addCell = [dict objectForKey:@"addCell"];
                [[addCell taskTextField] setDelegate:self];
                [[addCell taskTextField] setReturnKeyType:UIReturnKeyDone];
                [addCell setSelectionStyle:UITableViewCellSelectionStyleNone];
                return addCell;
            }
            else{
                TMAddExpandCustomTaskManagementCell *addCell = [dict objectForKey:@"addCell"];
                //[[addCell taskTextField] setDelegate:self];
                [[addCell taskTextField] setReturnKeyType:UIReturnKeyDone];
                [addCell setSelectionStyle:UITableViewCellSelectionStyleNone];
                return addCell;
            }
            
        }
    }

    
    
 // [tableView setEditing:YES animated:YES];
    //return cell;
}

-(CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger rowheight;
    if (indexPath.row == tableViewCellslist.count)
    {
        rowheight = 44;
    }
    else{
        NSDictionary *dict =[tableViewCellslist objectAtIndex:indexPath.row];
        NSString *string = [dict objectForKey:@"cell"];
        if ([string isEqualToString:@"AddCell"])
        {
            rowheight = 50;
        }
        else
        {
            rowheight = 100;
        }
    }
    return rowheight;
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
    if (indexPath.row == tableViewCellslist.count)
    {
        [self constructAddTaskManagementCells];
    }
    else
    {
        
         //[self constructAddExpandTaskManagementCells];
    }
  
    
}

#pragma Private Methods

-(void)constructAddTaskManagementCells
{
   // TMAddCustomTaskManagementCell *cell = [[TMAddCustomTaskManagementCell alloc] init];
    NSArray *nib=[[UINib nibWithNibName:@"TMAddCustomTaskManagementCell" bundle:nil] instantiateWithOwner:self options:nil];
    
   TMAddCustomTaskManagementCell *cell=(TMAddCustomTaskManagementCell*)[nib objectAtIndex:0];
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:cell,@"addCell",@"AddCell",@"cell" ,nil];
    [tableViewCellslist addObject:dict];
    [self.taskListTableView setScrollEnabled:YES];
    [self.taskListTableView reloadData];
}
-(void)constructAddExpandTaskManagementCells
{
   
    NSString *string = [selectedDict objectForKey:@"cell"];
    NSString *text = nil;
    if ([string isEqualToString:@"AddCell"])
    {
        TMAddCustomTaskManagementCell *tempCell = [selectedDict valueForKey:@"addCell"];
        text = tempCell.taskTextField.text;
    }
    NSArray *nib=[[UINib nibWithNibName:@"TMAddExpandCustomTaskManagementCell" bundle:nil] instantiateWithOwner:self options:nil];
    
    TMAddExpandCustomTaskManagementCell *cell=(TMAddExpandCustomTaskManagementCell*)[nib objectAtIndex:0];
    cell.taskTextField.text = text;
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:cell,@"addCell",@"AddExpandCell",@"cell" ,nil];
    [tableViewCellslist replaceObjectAtIndex:replaceIndex withObject:dict];
    [self.taskListTableView reloadData];
    
}
#pragma TextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField.text.length>0)
    {
         [textField resignFirstResponder];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Plese enter Task Text" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        
        [alert show];
    }
   
    return NO;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
   
   UITableViewCell *cell = (UITableViewCell*) [[textField superview] superview];
    NSDictionary *tempDict = nil;
    for (int i = 0; i<tableViewCellslist.count; i++)
    {
        NSDictionary *dict = [tableViewCellslist objectAtIndex:i];
        UITableViewCell *tempCell = [dict valueForKey:@"addCell"];
        if ([cell isEqual:tempCell])
        {
            tempDict = [[NSDictionary alloc] initWithDictionary:dict];
            replaceIndex = i;
        }
    }
    if (textField.text.length>0)
    {
        selectedDict = tempDict;
        [self constructAddExpandTaskManagementCells];
    }
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
}
@end
