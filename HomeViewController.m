//
//  HomeViewController.m
//  tours
//
//  Created by eq2-mac on 10/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "HomeViewController.h"

@implementation HomeViewController

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
//    ServerRequest *sr = [[ServerRequest alloc] init];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)buttonCreateTourPressed:(id)sender 
{
    NSLog(@"Create Tour Button Pressed");
    CreateTourViewController    *createTour = [[CreateTourViewController alloc] init];
    [self presentModalViewController:createTour animated:YES];
}

-(IBAction)buttonCreateStopPressed:(id)sender
{
    CreateStopViewController    *createStop = [[CreateStopViewController alloc] init];
    [self presentModalViewController:createStop animated:YES];

}

@end
