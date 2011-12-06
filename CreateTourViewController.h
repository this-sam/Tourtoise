//
//  CreateTourViewController.h
//  tours
//
//  Created by Austin Emmons on 11/19/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Animator.h"

#import "CategoryTableViewController.h"

@interface CreateTourViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
{
    UIImagePickerController *imagePicker;       //view to take photo and grab image from album
    
    
    
                                                            // Title and Category  PROGRESS VIEW 1
    IBOutlet UIView         *   progressView1;
    IBOutlet UITextField    *   pv1TourTitleTextField;
    IBOutlet UITextField    *   pv1TourCategoryTextField;
    CategoryTableViewController     *   categoryTableView;
                                                            // Photo Import  PROGRESS VIEW 2
    IBOutlet UIView         *   progressView2;
    IBOutlet UIButton       *   photoButton;
    IBOutlet UIButton       *   albumImageButton;
    IBOutlet UIImageView    *   pickedImage;
                                                            // Description and tags  PROGRESS VIEW 3
    IBOutlet UIView         *   progessView3;
    IBOutlet UITextView     *   pv3TourDescription;
    IBOutlet UITextField    *   pv3TourTagTextField;
    
    
    IBOutlet UIPageControl  *   pageControl;
    IBOutlet UIView         *   progressViewContainer;      //progression control
    NSArray                 *   progressViewArray;
    int                         currentProgressIndex;
    
}

- (void) resignAllFirstResponders;



-(IBAction) setCategoryTableAsFirstResponder:(id)sender;

- (IBAction)getImage:(id)sender;
- (IBAction)backButtonPressed:(id)sender;
- (IBAction)saveTourButtonPressed:(id)sender;
- (IBAction)addStopButtonPressed:(id)sender;


//progress view control
- (void)progressViewShow;
- (void)progressViewMoveForward;
- (void)progressViewMoveBackward;
- (void)progressViewSaveState;
- (void)progressViewLoadState;

- (IBAction)shoveViewUp:(id)sender;
- (IBAction)shoveViewDown:(id)sender;




@end
