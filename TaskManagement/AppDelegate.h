//
//  AppDelegate.h
//  TaskManagement
//
//  Created by Dhana Gadupooti on 16/09/13.
//  Copyright (c) 2013 Dhana Gadupooti. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TMListViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) TMListViewController *listVC;

@end
