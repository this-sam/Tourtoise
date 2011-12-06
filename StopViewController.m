//
//  StopViewController.m
//  tours
//
//  Created by eq2-mac on 10/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "StopViewController.h"

@implementation StopViewController

@synthesize backButton, mapButton;

- (id) initFromDictionary:(NSDictionary *) dict
{
    if ((self = [self initWithNibName:@"StopViewController" bundle:nil])) {     //our self init calls the super init
        // Custom initialization
        NSLog(@"inside initWithStop Dictionary Object: %@", dict);
        
        //grab strings from dictionary, store them as instance variables
        titleString         =   [dict objectForKey:@"title"];
        NSLog(@"Title String in Dict ::  %@", titleString);
        
        descriptionString   =   [dict objectForKey:@"description"];
        NSLog(@"Description String in Dict ::  %@", descriptionString);
        
        accessString        =   [dict objectForKey:@"access"];
        NSLog(@"Access String in Dict ::  %@", accessString);
        
        categoryString      =   [dict objectForKey:@"category"];
        NSLog(@"Category String in Dict ::  %@", categoryString);
        
        ageString           =   [dict objectForKey:@"age"];
        NSLog(@"Age String in Dict ::  %@", ageString);
        
        durationString      =   [dict objectForKey:@"duration"];
        NSLog(@"Duration String in Dict ::  %@", durationString);
        
        //then put strings into UIElements
        titleLabel.text         =   titleString;
        descriptionText.text    =   descriptionString;
        categoryText.text       =   categoryString;
        
        
        
    }
    return self;

}
- (id) initFromJSON:(NSString *) json
{
    if ((self = [self initWithNibName:@"StopViewController" bundle:nil])) {     //our self init calls the super init
        // Custom initialization
        NSLog(@"inside initWithStop JSONObject: %@", json);
    }
    return self;
    
}

- (IBAction)backButtonPressed:(id)sender {
    [self dismissModalViewControllerAnimated:TRUE];
    
}


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
    titleLabel = nil;
    descriptionText = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
