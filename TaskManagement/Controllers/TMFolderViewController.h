//
//  TMFolderViewController.h
//  TaskManagement
//
//  Created by Kalluri, Satya (external - Project) on 9/17/13.
//  Copyright (c) 2013 Dhana Gadupooti. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
@interface TMFolderViewController : UIViewController<UITableViewDelegate, UITableViewDataSource,NSFetchedResultsControllerDelegate>
@property (strong, nonatomic) IBOutlet UITableView *folderTableView;
@property (strong, nonatomic) NSMutableArray *folderArray;
@end
