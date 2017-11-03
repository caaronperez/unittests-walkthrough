//
//  AppDelegate.h
//  Walktrough_UnitTesting-ObjectiveC
//
//  Created by MCS Devices on 11/2/17.
//  Copyright © 2017 Mobile Consulting Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

