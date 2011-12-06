//
//  TtAppDelegate.h
//  Tourtoise
//
//  Created by Austin Emmons on 12/4/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreDataTestViewController.h"
#import "TtManagedObjectContextManager.h"

@interface TtAppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate>
{
    
    CoreDataTestViewController      *coreDataViewController;
    UINavigationController          *navController;
    TtManagedObjectContextManager   *managedObjectContextManager;
}



@property (strong, nonatomic) IBOutlet UIWindow *window;
@property (nonatomic, strong) IBOutlet UITabBarController *tabBarController;

@property (nonatomic, strong) TtManagedObjectContextManager      *managedObjectContextManager;

@property (readonly, strong, nonatomic) NSManagedObjectContext          *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel            *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator    *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
