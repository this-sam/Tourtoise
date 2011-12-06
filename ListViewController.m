//
//  ListViewController.m
//  tours
//
//  Created by Austin Emmons on 11/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ListViewController.h"


@implementation ListViewController




//*****  Properties of ListView Controller
//
//
@synthesize tours;
@synthesize stops;

@synthesize myParentViewController;

@synthesize listContainsTours   =   __listContainsTours;
@synthesize listContainsStops   =   __listContainsStops;





//-(id) init
//{
//    self = [super init];
//    if (self) {
//        // Custom initialization
//        NSLog(@"In ListViewController init");
//    }
//    return self;
//}


-(id) init
{
    self = [ super init];
    if (self) {
        // Custom initialization
        NSLog(@"In ListViewController init");
        NSLog(@"MEMORY ADDRESS  ::  %@", self);
                
        [self layoutSubviews];
        
        

        
        for (NSString *temp in tours) {
            NSLog(@"TOURS ::  %@", temp);
        }
        
        __listContainsStops = FALSE;
        __listContainsTours = FALSE;
    }
    
//    NSLog(@"Contains Stops :: Tours      %@ :: %@",__listContainsStops, __listContainsTours );
    
    return self;
}

-(void) layoutSubviews
{
    CGRect viewBounds = self.view.bounds;
    CGRect frame;
    
    frame = CGRectMake(0, 0, viewBounds.size.width, 40);
    __navbar = [[UINavigationBar alloc] initWithFrame:frame];
    __navbarTitle = [[UINavigationItem alloc] initWithTitle:@"Title"];
    
    __navbar.tintColor = [UIColor blackColor];
    [__navbar.items arrayByAddingObject:__navbarTitle];
    [self.view addSubview:__navbar];
    
    //back button
    frame = CGRectMake(10, 3, 77, 35);
    __navbarBackButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [__navbarBackButton setFrame:frame];
    [__navbarBackButton setTitle:@"Back" forState:UIControlStateNormal];
    [__navbarBackButton addTarget:self action:@selector(backButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [__navbar addSubview:__navbarBackButton];
    
    //list view Title
//    frame = CGRectMake(0, 0 , viewBounds.size.width, 40);
    //        __navbarTitle = [[UILabel alloc] initWithFrame:frame];
    //        __navbarTitle.text = @"Title" ;
    //        __navbarTitle.backgroundColor   = [UIColor clearColor];
    //        __navbarTitle.textAlignment     = UITextAlignmentCenter;
    //        __navbarTitle.textColor         = [UIColor whiteColor];
    //        __navbarTitle.font              = [UIFont systemFontOfSize:16];
    //        [__navbar addSubview:__navbarTitle];
    
    //list view
    frame = CGRectMake(0, 41, viewBounds.size.width, viewBounds.size.height-40);
    __listView = [[UITableView alloc] initWithFrame:frame];
    [self.view addSubview:__listView];
    __listView.delegate     = self;
    __listView.dataSource   = self;
}


- (void)dealloc
{
    NSLog(@"List to be dealloced: %@", self);
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
    
    tours = [[NSArray alloc] initWithObjects:@"Tour 1",@"Tour 2",@"Tour 3",@"Tour 4",@"Tour 5", nil];
    stops = [[NSArray alloc] initWithObjects:@"Stop 1",@"Stop 2",@"Stop 3",@"Stop 4",@"Stop 5", nil];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    tours = nil;
    stops = nil;
    
    
    __navbar = nil;
    __navbarTitle = nil;
    __navbarBackButton = nil;
    __listView = nil;
    __backgroundView = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 5;
    if (__listContainsTours) {
        NSLog(@"List contains Tours");
        return [self.tours count];
    }
    if (__listContainsStops) {
        NSLog(@"List contains Stops");
        return [self.stops count];
    }
//    return 5;
    return 0;
}


//Initializing Table Cells
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";

    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    if (__listContainsTours) {
        NSLog(@"Object at IndexPath.row    '%@'", [tours objectAtIndex:indexPath.row] );
        cell.textLabel.text = [tours objectAtIndex:indexPath.row];
    }
    else if (__listContainsStops) {
        NSLog(@"Object at IndexPath.row    '%@'", [stops objectAtIndex:indexPath.row] );
        cell.textLabel.text = [stops objectAtIndex:indexPath.row];
    }
    //[CellIdentifier release];
    
//    NSLog(@"Inserting data into TableView");
    
    return cell;
}



#pragma mark - Table view delegate
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/


// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}




- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];    //cell returns to white
    
    
    //list contains Tours
    if (__listContainsTours) {
        // Navigation logic may go here. Create and push another view controller.
         TourHomeViewController *detailViewController = [[TourHomeViewController alloc] initWithTour:@"JSON Object"];
        NSLog(@"%@", detailViewController);
        
         // 
         // Pass the selected object to the new view controller.
        [self presentModalViewController:detailViewController animated:YES];
        NSLog(@"Should go to TourHome View");
    }
    
    
    
    //list contains Stops
    if (__listContainsStops) {
        // Navigation logic may go here. Create and push another view controller.
        StopViewController *detailViewController = [[StopViewController alloc] initFromJSON:@"JSON Object for Stop"];
        NSLog(@"%@", detailViewController);
        
        // 
        // Pass the selected object to the new view controller.
        [self presentModalViewController:detailViewController animated:YES];
        NSLog(@"Should go to TourHome View");
    }
    
}

/*************************************************************
 *************************************************************
 **                                                          *
 **             Switching between Views                      *
 **                                                          *
 *************************************************************
 *************************************************************/

-(void)backButtonPressed{
    NSLog(@"Back button pressed");
    NSLog(@"PARENT VIEW CONTROLLER:  %@", self.myParentViewController);
    [self.myParentViewController dismissModalViewControllerAnimated:TRUE];
    
}




@end
