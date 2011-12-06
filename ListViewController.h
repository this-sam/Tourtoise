//
//  ListViewController.h
//  tours
//
//  Created by Austin Emmons on 11/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TourListViewCell.h"
#import "TourHomeViewController.h"
#import "StopViewController.h"


@interface ListViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>{
    
    UIView                 *__backgroundView;
    UINavigationBar        *__navbar;
    UINavigationItem       *__navbarTitle;

    UIButton               *__navbarBackButton;
    UITableView            *__listView;
    
    
    NSArray         *array;
    __strong NSArray     *tours;
    NSArray     *stops;
    
    UIViewController       *__parentViewController;
    
    
    BOOL __listContainsTours;                    //using booleans, we can switch behavior based on what is being held in lists.
    BOOL __listContainsStops;
    
    
    
}

@property (nonatomic, strong) NSArray * tours;
@property (nonatomic, strong) NSArray * stops;

@property (nonatomic, strong) UIViewController *  myParentViewController;

@property (nonatomic, assign) BOOL listContainsTours;
@property (nonatomic, assign) BOOL listContainsStops;

-(void) layoutSubviews;
-(void) backButtonPressed;



@end
