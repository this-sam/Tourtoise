//
//  CategoryTableViewDelegate.m
//  tours
//
//  Created by Austin Emmons on 12/3/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "CategoryTableViewController.h"

@implementation CategoryTableViewController


-(id) initWithTextfield:(UITextField *) textfield
{
    if (self = [super initWithStyle:UITableViewStylePlain]) {
        categories = [[NSArray alloc] initWithObjects:@"Museum", @"Campus", @"Historical", @"Restaurant",@"Entertainment", nil];
        NSLog(@"Categories count :: %i", [categories count]);
        
        selectedCategories = [[NSMutableArray alloc] initWithCapacity:[categories count]];
        
        outputTextField = textfield;
        outputTextField.inputView = self.view;
        
        self.tableView.delegate     = self;
        self.tableView.dataSource   = self;
        
        self.view.bounds = CGRectMake(0, 0, 320, 180);
        
    }
    
    return self;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"Categories";
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //table view length should be same as categories
     NSLog(@"Categories count for rowsInSection :: %i", [categories count]);
    return [categories count];
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    creates cell and returns it to the tableView.
//    Also sets category label as string from categories tableView
    
    static NSString *cellIdentifier = @"category";
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [categories objectAtIndex:indexPath.row];
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    
    //    ***Table Cell Selection for Categories. Checkmarks cell accesoryview, updates textfield
    //    
    
    
    NSString *categoryAtIndexPathRow = [categories objectAtIndex:indexPath.row];
    NSLog(@"Selected Category : %@", categoryAtIndexPathRow);
    
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell.accessoryType == UITableViewCellAccessoryNone) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        //        categoryTextField.text = @"Yes.";
        // Reflect selection in data model
        [selectedCategories insertObject:categoryAtIndexPathRow atIndex:0]; //insert to head of array
        
        
    } else if (cell.accessoryType == UITableViewCellAccessoryCheckmark) {
        cell.accessoryType = UITableViewCellAccessoryNone;
        //        categoryTextField.text = @"No.";
        // Reflect deselection in data model
        [selectedCategories removeObjectIdenticalTo:categoryAtIndexPathRow];
        
    }
    categoryString = @"";
    int count = [selectedCategories count];
    for (int i = 0; i < count; i++ ) {
        NSLog(@"%i  %@", i, [selectedCategories objectAtIndex:i]);
        if (count == 0) {
            categoryString = [selectedCategories objectAtIndex:i];
        }else{
            categoryString = [[selectedCategories objectAtIndex:i] stringByAppendingFormat:@", %@",categoryString];
        }
    }
    NSLog(@"category string :: %@", categoryString);

    outputTextField.text = categoryString;
    NSLog(@"Output TextField :: %@", outputTextField.text);
    
}

@end
