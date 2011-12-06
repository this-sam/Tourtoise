//
//  TourHomeViewController.m
//  tours
//
//  Created by eq2-mac on 11/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TourHomeViewController.h"

@implementation TourHomeViewController

-(id) initWithTour:(NSString *) JSONTour
{
//    Should decode JSON Object and construct tour labels, images, and textboxes
//    
    
    if ((self = [self initWithNibName:@"TourHomeViewController" bundle:nil])) {     //our self init calls the super init
        // Custom initialization
//        NSLog(@"inside initWithTour JSONObject: %@", JSONTour);
    }
    return self;
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
    __scrollView = nil;
    __title = nil;
    __previewImage = nil;
    __description = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    
}
- (IBAction)backButtonPressed:(id)sender 
{
    NSLog(@"Tour Back button pressed");
    [self dismissModalViewControllerAnimated:TRUE];
}

- (IBAction)startTourButtonPressed:(id)sender 
{
    NSLog(@"Start Tour button pressed");
}

- (IBAction)stopListButtonPressed:(id)sender 
{
    NSLog(@"Stop List button pressed");
    NSLog(@"-Should move to ListView containing stops");
//    
    // Navigation logic may go here. Create and push another view controller.
    ListViewController *detailViewController = [[ListViewController alloc] init];
    // ...
    // Pass the selected object to the new view controller.
    detailViewController.listContainsTours = FALSE;
    detailViewController.listContainsStops = TRUE;
    detailViewController.myParentViewController = self;
    [self presentModalViewController:detailViewController animated:YES];
    
}
- (IBAction) mapButtonPressed:(id)sender 
{
    NSLog(@"Map button pressed");
    
    MapViewController *mapViewController = [[MapViewController alloc] init];
    [self presentModalViewController:mapViewController animated:YES];
    
}


@end
