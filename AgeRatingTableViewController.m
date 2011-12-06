//
//  AgeRatingTableViewController.m
//  tours
//
//  Created by Austin Emmons on 12/3/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "AgeRatingTableViewController.h"

@implementation AgeRatingTableViewController
-(id) initWithTextfield:(UITextField *) textfield
{
    if (self = [super initWithStyle:UITableViewStylePlain]) {
        ratings = [[NSArray alloc] initWithObjects:@"G", @"PG", @"PG-13", @"R",@"NC-17", nil];
        NSLog(@"AgeRating count :: %i", [ratings count]);
        
        selectedratings = [[NSMutableArray alloc] initWithCapacity:[ratings count]];
        
        outputTextField = textfield;
        outputTextField.inputView = self.view;
        
        self.tableView.delegate     = self;
        self.tableView.dataSource   = self;
        
        self.view.bounds = CGRectMake(0, 0, 320, 180);
        
    }
    
    return self;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"Age Rating";
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //table view length should be same as ratings
    NSLog(@"Age Rating count for rowsInSection :: %i", [ratings count]);
    return [ratings count];
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    creates cell and returns it to the tableView.
    //    Also sets rating label as string from ratings tableView
    
    static NSString *cellIdentifier = @"age";
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [ratings objectAtIndex:indexPath.row];
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    
    //    ***Table Cell Selection for ratings. Checkmarks cell accesoryview, updates textfield
    //    
    
    
    NSString *ratingAtIndexPathRow = [ratings objectAtIndex:indexPath.row];
    NSLog(@"Selected Age Rating : %@", ratingAtIndexPathRow);
    
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell.accessoryType == UITableViewCellAccessoryNone) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        //        ratingTextField.text = @"Yes.";
        // Reflect selection in data model
        [selectedratings insertObject:ratingAtIndexPathRow atIndex:0]; //insert to head of array
        
        
    } else if (cell.accessoryType == UITableViewCellAccessoryCheckmark) {
        cell.accessoryType = UITableViewCellAccessoryNone;
        //        ratingTextField.text = @"No.";
        // Reflect deselection in data model
        [selectedratings removeObjectIdenticalTo:ratingAtIndexPathRow];
        
    }
    ratingString = @"";
    int count = [selectedratings count];
    for (int i = 0; i < count; i++ ) {
        NSLog(@"%i  %@", i, [selectedratings objectAtIndex:i]);
        if (count == 0) {
            ratingString = [selectedratings objectAtIndex:i];
        }else{
            ratingString = [[selectedratings objectAtIndex:i] stringByAppendingFormat:@", %@",ratingString];
        }
    }
    NSLog(@"rating string :: %@", ratingString);
    
    outputTextField.text = ratingString;
    NSLog(@"Output TextField :: %@", outputTextField.text);
    
}

@end
