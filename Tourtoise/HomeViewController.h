//
//  HomeViewController.h
//  Tourtoise
//
//  Created by Austin Emmons on 12/5/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

#import "Tour.h"
#import "Stop.h"

@interface HomeViewController : UIViewController <UITextFieldDelegate>
{
    NSManagedObjectContext  *managedObjectContext;
    NSPersistentStoreCoordinator    *persistentStoreCoordinator;
    __weak IBOutlet UITextField *textfield;
    __weak IBOutlet UITextView *loadedText;
    
    
}

@property (nonatomic, retain) NSManagedObjectContext        *   managedObjectContext;
@property (nonatomic, retain) NSPersistentStoreCoordinator  *   persistentStoreCoordinator;

- (IBAction)buttonSave:(id)sender;
- (IBAction)buttonLoad:(id)sender;
- (IBAction)buttonReset:(id)sender;



@end
