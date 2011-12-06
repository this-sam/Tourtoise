//
//  StopViewController.h
//  tours
//
//  Created by eq2-mac on 10/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StopViewController : UIViewController
{
    NSString    *   titleString;
    NSString    *   descriptionString;
    NSString    *   accessString;
    NSString    *   categoryString;
    NSString    *   ageString;
    NSString    *   durationString;
    
    
    
    IBOutlet UILabel        *titleLabel;
    IBOutlet UITextView     *descriptionText;
    IBOutlet UITextField    *categoryText;
    
    
    
}

@property (nonatomic, retain) IBOutlet UIButton *   backButton;
@property (nonatomic, retain) IBOutlet UIButton *   mapButton;

- (id) initFromDictionary:(NSDictionary *)dict;
- (id) initFromJSON:(NSString *) json;


- (IBAction)backButtonPressed:(id)sender;

@end
