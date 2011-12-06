//
//  HomeViewController.m
//  Tourtoise
//
//  Created by Austin Emmons on 12/5/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "HomeViewController.h"

@implementation HomeViewController

@synthesize managedObjectContext;
@synthesize persistentStoreCoordinator;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    textfield = nil;
    loadedText = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (BOOL) textFieldShouldReturn:(UITextField *) textField
{
    [textField resignFirstResponder];
    return YES;
}


- (IBAction)buttonSave:(id)sender {
    
    NSLog(@"buttonSave Pressed");
    NSString *savedtitle = textfield.text;
    NSLog(@"Saved Title :: %@", savedtitle);
    
    NSLog(@"Managed Object Context :: %@", managedObjectContext);
    
    Stop *stop = (Stop *)[NSEntityDescription insertNewObjectForEntityForName:@"Stop" inManagedObjectContext:managedObjectContext];
    [stop setTitle:savedtitle];
    
    
    NSError *error = nil;
    if (![managedObjectContext save:&error]) {
        NSLog(@"Something went wrong while saving...");
    }
    
    
    NSLog(@"Save Successful");
    
}

- (IBAction)buttonLoad:(id)sender {
    
    NSLog(@"buttonLoad Pressed");
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Stop" inManagedObjectContext:managedObjectContext];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"title" ascending:NO];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    [request setSortDescriptors:sortDescriptors];

    NSError *error = nil;
    NSMutableArray *mutableFetchResults = [[managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
    
    if (!mutableFetchResults) {
        //Handle Error
        NSLog(@"Somthing happened while loading...");
    
    }
    
    NSString *textViewString = @"";
    for (Stop* stop in mutableFetchResults) {
        textViewString = [textViewString stringByAppendingFormat:@"%@ \n", stop.title];
        NSLog(@"%@", stop.title);
    }
    loadedText.text = textViewString;
    
}

-(IBAction)buttonReset:(id)sender
{
    NSLog(@"buttonReset Pressed");
    NSPersistentStore *store = [self.persistentStoreCoordinator.persistentStores lastObject];
    NSError *error = nil;
    NSURL *storeURL = store.URL;
    [self.persistentStoreCoordinator removePersistentStore:store error:&error];
    [[NSFileManager defaultManager] removeItemAtURL:storeURL error:&error];
    
    
    NSLog(@"Data Reset");
    
    //reset persistent store for future saves
    if (![self.persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // do something with the error
    }
    
}
@end
