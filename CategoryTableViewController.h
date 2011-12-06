//
//  CategoryTableViewDelegate.h
//  tours
//
//  Created by Austin Emmons on 12/3/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CategoryTableViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>
{
    NSArray         *categories;
    UITextField     *outputTextField;
    NSMutableArray          *   selectedCategories;
    NSString                *   categoryString;
}


- (id) initWithTextfield:(UITextField *) textfield;

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;


@end
