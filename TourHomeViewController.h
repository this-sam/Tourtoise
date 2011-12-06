//
//  TourHomeViewController.h
//  tours
//
//  Created by eq2-mac on 11/5/11.
//  Copyright 2011 iCompute. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListViewController.h"
#import "StopViewController.h"
#import "MapViewController.h"

@interface TourHomeViewController : UIViewController {
    
    IBOutlet UIScrollView   *__scrollView;

    
    //should be set when tour item pressed in listview
    IBOutlet UILabel        *__title;
    IBOutlet UIImageView    *__previewImage;
    IBOutlet UITextView     *__description;
    
    
    
}









- (id) initWithTour:(NSString *) JSONTour;
- (IBAction) backButtonPressed:(id)sender;
- (IBAction) startTourButtonPressed:(id)sender;
- (IBAction) stopListButtonPressed:(id)sender;
- (IBAction) mapButtonPressed:(id)sender;

@end
