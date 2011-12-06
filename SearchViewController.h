//
//  SearchViewController.h
//  tours
//
//  Created by eq2-mac on 10/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListViewController.h"
#import "CategoryTableViewController.h"

@interface SearchViewController : UIViewController {
    
    IBOutlet UITextField    *  locationTextField;
    IBOutlet UITextField    *  categoryTextField;
    IBOutlet UITextField    *  keywordTextField;
    IBOutlet UITextField    *  rangeTextField;
    IBOutlet UITextField    *  durationTextField;
    IBOutlet UITextField    *  admissionTextField;
    
    IBOutlet UISwitch       *   audioSwitch;
    IBOutlet UISwitch       *   visualSwitch;
    
   //custom category picker view 
    CategoryTableViewController *   categoryTableView;
    
}

- (IBAction)search:(id)sender;

- (IBAction) setCategoryTableAsFirstResponder:(id)sender;



//
//  animations
//
//- (void)animateCategoryTableViewToShowState;
//- (void)animateCategoryTableViewToHideState;


- (void)switchToListViewController;

@end
