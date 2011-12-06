//
//  CreateTourViewController.m
//  tours
//
//  Created by Austin Emmons on 11/19/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "CreateTourViewController.h"

@implementation CreateTourViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        imagePicker = [[UIImagePickerController alloc] init];
        // Delegate is self
        imagePicker.delegate = self;
        // Allow editing of image ?
        imagePicker.allowsEditing = YES;
        
        
        
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
    progressViewArray = [[NSArray alloc] initWithObjects:progressView1,progressView2, progessView3, nil];
    //show first progess view
    [self progressViewShow];
    
    //category tableView add as subview
    categoryTableView = [[CategoryTableViewController alloc] initWithTextfield:pv1TourCategoryTextField];
    
    //Sets tableview as first responder for text field instead of keyboard
    pv1TourCategoryTextField.inputView = categoryTableView.view;
    
//    Initialize swipe down gesture recognizer to hide responding view (keyboard/categoryTableView)
    UISwipeGestureRecognizer *swipeDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeDown:)];
    swipeDown.direction = UISwipeGestureRecognizerDirectionDown;
    [self.view addGestureRecognizer:swipeDown];

    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeRight:)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeRight];
    
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeLeft:)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeLeft];

}
-(void) swipeDown:(UISwipeGestureRecognizer *)recognizer
{
    if (recognizer.state == UIGestureRecognizerStateRecognized) {
        [self resignAllFirstResponders];
    }
}
-(void) swipeRight:(UISwipeGestureRecognizer *)recognizer
{
    if (recognizer.state == UIGestureRecognizerStateRecognized) {
        [self progressViewMoveForward];
    }
}
-(void) swipeLeft:(UISwipeGestureRecognizer *)recognizer
{
    if (recognizer.state == UIGestureRecognizerStateRecognized) {
        [self progressViewMoveBackward];
    }
}

- (void)viewDidUnload
{
    pickedImage = nil;
    photoButton = nil;
    albumImageButton = nil;
    progressView1 = nil;
    pv1TourTitleTextField = nil;
    pv1TourCategoryTextField = nil;
    progressView2 = nil;
    progessView3 = nil;
    pv3TourDescription = nil;
    pv3TourTagTextField = nil;
    categoryTableView = nil;
    progressViewContainer = nil;
    pageControl = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Button Events
-(IBAction)backButtonPressed:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction)saveTourButtonPressed:(id)sender {
    [self progressViewSaveState];
}

- (IBAction)addStopButtonPressed:(id)sender {
    // Saves Tour, deallocates CreateTourViewController
    // Presents Create Stop View Controller Modally from home screen (without seeing home screen)
    //          Should make call to home view controller to present Modal View Controller so that
    //          deallocation can be done in background?
    //          
    //          
    
    
}

-(void)setCategoryTableAsFirstResponder:(id)sender
{
    [categoryTableView becomeFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField 
{
    //makes keyboard go away when return is pressed
    [textField resignFirstResponder];
    NSLog(@"Text field: %@", textField.text );
    return YES;    
}

- (void) resignAllFirstResponders
{
    //pv1
    [pv1TourTitleTextField      resignFirstResponder];
    [pv1TourCategoryTextField   resignFirstResponder];
    //pv3
    [pv3TourDescription         resignFirstResponder];
    [pv3TourTagTextField        resignFirstResponder];
}
/*************************************************************
 *************************************************************
 **                                                          *
 **                   Image Picker                           *
 **                                                          *
 *************************************************************
 *************************************************************/
#pragma mark - Progress View 2
- (void) alertView:(UIAlertView *)alert clickedButtonAtIndex:(NSInteger)buttonIndex
{
	// After saving iamge, dismiss camera
	[self dismissModalViewControllerAnimated:YES];
}

-(IBAction)getImage:(id)sender
{
    NSLog(@"getImage Called");
    if ((UIButton *)sender == photoButton) {
        // Set source to the camera
        imagePicker.sourceType =  UIImagePickerControllerSourceTypeCamera;
    }else if ((UIButton *)sender == albumImageButton){
        //Set source to the saved photos album
        imagePicker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    }
    
    // Show image picker
	[self presentModalViewController:imagePicker animated:YES];	
    
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    UIAlertView *alert;
    
	// Unable to save the image  
    if (error)
        alert = [[UIAlertView alloc] initWithTitle:@"Error" 
                                           message:@"Unable to save image to Photo Album." 
                                          delegate:self cancelButtonTitle:@"Ok" 
                                 otherButtonTitles:nil];
	else // All is well
        alert = [[UIAlertView alloc] initWithTitle:@"Success" 
                                           message:@"Image saved to Photo Album." 
                                          delegate:self cancelButtonTitle:@"Ok" 
                                 otherButtonTitles:nil];
    
    
    [alert show];
}

- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
	// Access the uncropped image from info dictionary
	UIImage *chosenImage = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    
    NSLog(@"CHOSEN IMAGE :: %@", chosenImage);
    
	pickedImage.image = chosenImage;
    
    // After saving image, dismiss pickerView
	[self dismissModalViewControllerAnimated:YES];
}



/*************************************************************
 *************************************************************
 **                                                          *
 **               Progress View Control                      *
 **                                                          *
 *************************************************************
 *************************************************************/
#pragma mark - Progress View Control

-(void) progressViewShow
{
    [progressViewContainer addSubview:progressView1];
    currentProgressIndex = 0;
    NSLog(@"currentProgressIndex  ::  %i", currentProgressIndex);
}

-(void) progressViewMoveForward
{
    NSLog(@"Progress will Move Forward");
    if (currentProgressIndex < 2) {
        // Need to animate motion to the left if not at the third page.
        //              Need to have an attempted response (move then bounce back) when at third page
        // pull in next page from right
        
        
        //shift left out of view
        UIView *view = self.view;
        [Animator horizontalShift:progressView1 distance:(-view.bounds.size.width)];
        
        currentProgressIndex++;
        NSLog(@"Current Progress Index  ::  %i", currentProgressIndex);
        
        //update pageControl
        pageControl.currentPage = currentProgressIndex;
    }
//    user feedback if at end of progress and trying to move forward
//    if (currentProgressIndex == 2) {
//              move right and then bounce back left
//        UIView *view = self.view;
//        [Animator horizontalShift:progressView1 distance:(-view.bounds.size.width/2)];
//        [Animator horizontalShift:progressView1 distance:(view.bounds.size.width/2)];
//    }
    
}

-(void) progressViewMoveBackward
{
    NSLog(@"Progress will Move Backward");
    if (currentProgressIndex != 0) {
//        UIView  *currentView = [progressViewArray objectAtIndex:currentProgressIndex];
        // Need to animate motion to the right if not at the first page.
        //              Need to have an attempted response (move then bounce back) when at first page
        // pull in next page from left
        
        //shift right out of view
        UIView *view = self.view;
        [Animator horizontalShift:progressView1  distance:(view.bounds.size.width)];
        
        currentProgressIndex--;
        NSLog(@"Current Progress Index  ::  %i", currentProgressIndex);
        
        //update pageControl
        pageControl.currentPage = currentProgressIndex;
    }
//      user feedback if at beginning of progress and trying to move backward
//    if (currentProgressIndex == 0) {
//              move left then bounce back right
//        UIView *view = self.view;
//        [Animator horizontalShift:progressView1 distance:(view.bounds.size.width/2)];
//        [Animator horizontalShift:progressView1 distance:(-view.bounds.size.width/2)];
//    }
    
}
-(void) progressViewSaveState
{
    NSLog(@"Progress View Save State");
    NSLog(@"Title       :: %@", pv1TourTitleTextField);
    NSLog(@"Category    :: %@", pv1TourCategoryTextField);
    
    NSLog(@"Image       :: %@", pickedImage);
    
    NSLog(@"Description :: %@", pv3TourDescription);
    NSLog(@"Tags        :: %@", pv3TourTagTextField);
    //need to create JSON object and save tour
    
    NSArray *objects    = [[NSArray alloc] initWithObjects:pv1TourTitleTextField,pv3TourDescription,pv1TourCategoryTextField,pv3TourTagTextField, nil];
    NSArray *keys       = [[NSArray alloc] initWithObjects:@"title", @"description", @"category", @"tags", nil];
    
    NSDictionary *tour = [[NSDictionary alloc] initWithObjects:objects forKeys:keys];
    
    NSLog(@"Tour %@", tour);
    
}
-(void) progressViewLoadState
{
    //need to load JSON object from core data and decode information into text fields
}

-(IBAction)shoveViewUp:(id)sender
{
    //only called when tag text field begins editing because this textfield is hidden by the keyboard
    [Animator verticalShift:progessView3 distance:-80];
    
}
-(IBAction)shoveViewDown:(id)sender
{
    //only called when tag text field begins editing because this textfield is hidden by the keyboard
    [Animator verticalShift:progessView3 distance:80];
    
}



@end
