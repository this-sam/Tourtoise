//
//  CreateStopViewController.h
//  tours
//
//  Created by Austin Emmons on 11/29/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "Animator.h"


#import "CategoryTableViewController.h"
#import "AgeRatingTableViewController.h"

#import "StopViewController.h"
#import "Stop.h"
#import "TtManagedObjectContextManager.h"

@interface CreateStopViewController : UIViewController

//      Need to add Where is this place? and get location from place on map or current location
//      
//      
//      

{
    IBOutlet UIPageControl  *   pageControl;
    int     currentPage;
    
    
    IBOutlet UITextField    *   titleTextField;
    IBOutlet UITextView     *   descriptionTextView;
    IBOutlet UITextField    *   accessTextField;
    IBOutlet UITextField    *   categoryTextField;
    IBOutlet UITextField    *   ageTextField;
    IBOutlet UITextField    *   durationTextField;
    
    IBOutlet UIView         *   contentView;
    
    IBOutlet UIDatePicker   *   durationPickerView;
    
    IBOutlet UIView         *   stopPreviewViewContainer;
    
    
    
    CategoryTableViewController     *   categoryPickerTableView;
    UITableViewController           *   ageRatingTableView;

    
    
}
        

-(IBAction)backButtonPressed:(id)sender;

-(IBAction) setCategoryTableAsFirstResponder:(id)sender;
-(IBAction) setAgeRatingTableAsFirstResponder:(id)sender;
-(IBAction) setDurationPickerViewAsFirstResponder:(id)sender;

//Stop Preview
-(void) showStopPreview;

//  Save/Load
-(NSDictionary *)createDictionaryFromTextInput;
-(void) saveStop;
-(void) loadStopIntoViewFromCoreData;

@end
