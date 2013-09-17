//
//  TMAddExpandCustomTaskManagementCell.h
//  TaskManagement
//
//  Created by Dhana Gadupooti on 17/09/13.
//  Copyright (c) 2013 Dhana Gadupooti. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TMAddExpandCustomTaskManagementCell : UITableViewCell
{
    
}
@property(nonatomic,strong) IBOutlet UIButton *checkButton;
@property(nonatomic,strong) IBOutlet UIButton *reminderButton;
@property(nonatomic,strong) IBOutlet UIButton *folderButton;
@property(nonatomic,strong) IBOutlet UIButton *mailButton;
@property(nonatomic,strong) IBOutlet UIButton *priorityButton;
@property(nonatomic,strong) IBOutlet UITextField *taskTextField;
@property(nonatomic,strong) IBOutlet UIImageView *priorityImageView;
@end
