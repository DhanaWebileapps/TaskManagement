//
//  TMListViewController.h
//  TaskManagement
//
//  Created by Dhana Gadupooti on 16/09/13.
//  Copyright (c) 2013 Dhana Gadupooti. All rights reserved.
//

#import <UIKit/UIKit.h>



#define TASK_LIST_NIB @"TMListView"

@interface TMListViewController : UIViewController
{
    
}
@property(nonatomic,strong) IBOutlet UIView *taskListFooterView;
@property(nonatomic,strong) IBOutlet UIView *headerView;
@property(nonatomic,strong) IBOutlet UILabel *headerLabel;
@property(nonatomic,strong) IBOutlet UITableView *taskListTableView;
@end
