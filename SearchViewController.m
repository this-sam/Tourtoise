//
//  SearchViewController.m
//  tours
//
//  Created by eq2-mac on 10/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SearchViewController.h"

@implementation SearchViewController  

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        NSLog(@"MEMORY ADDRESS  ::  %@", self);
        
    
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
    //categoryTextField.inputView = categoryTableView.view;
    
    
    //creates categoryTableView with corresponding text field. sets textfield input view to table view.
    categoryTableView = [[CategoryTableViewController alloc] initWithTextfield:categoryTextField];
    //categoryTextField.inputView = categoryTableView.view;
    
    UISwipeGestureRecognizer *keyboardSwipeDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeAwayKeyboard:)];
    [keyboardSwipeDown setDirection:UISwipeGestureRecognizerDirectionDown];
    [self.view addGestureRecognizer:keyboardSwipeDown];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    
    locationTextField   = nil;
    keywordTextField    = nil;
    rangeTextField      = nil;
    durationTextField   = nil;
    admissionTextField  = nil;
    audioSwitch         = nil;
    visualSwitch        = nil;
    categoryTextField   = nil;
    categoryTableView   = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


-(void)resignAllFirstResponders{
    [locationTextField  resignFirstResponder];
    [keywordTextField   resignFirstResponder];
    [categoryTextField  resignFirstResponder];
    [rangeTextField     resignFirstResponder];
    [durationTextField  resignFirstResponder];
    [admissionTextField resignFirstResponder];
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    //makes keyboard go away when return is pressed
    [textField resignFirstResponder];
    NSLog(@"Text field: %@", textField.text );
    return YES;    
}

/************************************************************
*************************************************************
**                                                          *
**                      IBActions                           *
**                                                          *
*************************************************************
*************************************************************/

#pragma mark - IBActions


- (IBAction)search:(id)sender {
    NSLog(@"search :%@",[locationTextField  text]);
    NSLog(@"search :%@",[keywordTextField   text]);
    NSLog(@"search :%@",[categoryTextField   text]);
    NSLog(@"search :%@",[rangeTextField     text]);
    NSLog(@"search :%@",[durationTextField  text]);
    NSLog(@"search :%@",[admissionTextField text]);
    
    NSLog(@"Search Button Pressed");
    [self switchToListViewController];
    
}

/************************************************************
*************************************************************
**                                                          *
**                      Gestures                            *
**                                                          *
*************************************************************
*************************************************************/

#pragma mark - Gestures

-(void) swipeAwayKeyboard: (UISwipeGestureRecognizer *) recognizer
{
    if (recognizer.state == UIGestureRecognizerStateRecognized) {
        [self resignAllFirstResponders];
        
    }// if recognizer.state
    
}

/*************************************************************
 *************************************************************
 **                                                          *
 **         First Responder For Category Picker              *
 **                                                          *
 *************************************************************
 *************************************************************/
#pragma mark - First Responder Implemented Methods
-(IBAction) setCategoryTableAsFirstResponder:(id)sender
{
    // called when categoryTextField is pressed (Did Begin Editing). 
    [categoryTableView becomeFirstResponder];
}

/*************************************************************
 *************************************************************
 **                                                          *
 **             Switching between Views                      *
 **                                                          *
 *************************************************************
 *************************************************************/
#pragma mark - Switching Views
-(void) switchToListViewController{
    NSLog(@"Switch to ListView");
    ListViewController *searchResultsController = [[ListViewController alloc] init];
    searchResultsController.listContainsTours = TRUE;
    searchResultsController.listContainsStops = FALSE;
    searchResultsController.myParentViewController = self;
    [self presentModalViewController:searchResultsController animated:YES];
    
}


@end



















