//
//  TourListViewCell.h
//  tours
//
//  Created by Austin Emmons on 11/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TourListViewCell : UITableViewCell {
    
    UIView          *__contentView;      //case View of th cell. This will determine size and shape (I think)   
    UIView          *__backgroundView;   //backgroundView is simply the backroundView of the cell
    UIView          *__accesoryView;     //view that is used, typically for control at the right hand side of the cell
    
    UILabel         *__primaryLabel;
    UILabel         *__secondaryLabel;
    UIImageView     *__preview;
    
    

}


//Properties

@property (nonatomic, strong) UIView        *contentView;
@property (nonatomic, strong) UIView        *backgroundView;
@property (nonatomic, strong) UIView        *accesoryView;

@property (nonatomic, strong) UILabel       *primaryLabel;
@property (nonatomic, strong) UILabel       *secondaryLabel;
@property (nonatomic, strong) UIImageView   *preview;


//Instance Methods
- (void) layoutSubviews;
- (void) pullInfoFromObject:(id)object;



//Class Methods

@end
