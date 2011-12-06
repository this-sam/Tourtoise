//
//  TourListViewCell.m
//  tours
//
//  Created by Austin Emmons on 11/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TourListViewCell.h"

#define k_CELLHEIGHT 88


@implementation TourListViewCell

@synthesize contentView         =       __contentView;
@synthesize backgroundView      =       __backgroundView;
@synthesize accesoryView        =       __accesoryView;

@synthesize primaryLabel        =       __primaryLabel;
@synthesize secondaryLabel      =       __secondaryLabel; 
@synthesize preview             =       __preview; 


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        __contentView       =   [[UIView alloc] init];
        __backgroundView    =   [[UIView alloc] init];
        __accesoryView      =   [[UIView alloc] init];
        __primaryLabel      =   [[UILabel alloc] init];
        __secondaryLabel    =   [[UILabel alloc] init];
        __preview           =   [[UIImageView alloc] init];
        
        //customize contentView
        __contentView.bounds = CGRectMake(0, 0, self.superview.bounds.size.width, k_CELLHEIGHT);
        
        //customize backgroundView
        __backgroundView.backgroundColor = [UIColor blueColor];
        
        //customize accesoryView
        __accesoryView.hidden = TRUE;       //hide it to start initially. Will be used for deleting tours
        
        //customize primaryLabel
        __primaryLabel.textAlignment = UITextAlignmentLeft;
        __primaryLabel.font   =   [UIFont systemFontOfSize:14];
        
        //customize secondaryLabel
        __secondaryLabel.textAlignment = UITextAlignmentLeft;
        __secondaryLabel.font     =   [UIFont systemFontOfSize:10];
        __secondaryLabel.textColor    =   [UIColor grayColor];
       
        self.contentView = __contentView;
        
        [self.contentView addSubview:__backgroundView];
        [self.contentView addSubview:__accesoryView];
        [self.contentView addSubview:__primaryLabel];
        [self.contentView addSubview:__secondaryLabel];
        [self.contentView addSubview:__preview];
    }
    return self;
}

- (void) layoutSubviews{
    [super layoutSubviews];
    
    CGRect      contentRect = self.contentView.bounds;
    CGFloat     boundsX = contentRect.origin.x;
    CGFloat     boundsY = contentRect.origin.y;
    CGRect      frame;
    
    frame = CGRectMake(boundsX, boundsY, contentRect.size.width, contentRect.size.width);
    __backgroundView.frame = frame;
    
    frame = CGRectMake(boundsX+10, 0, 50, 50);
    __preview.frame = frame;
    
    frame = CGRectMake(boundsX+70, 5, 200, 25);
    __primaryLabel.frame = frame;
    
    frame = CGRectMake(boundsX+70, 30, 100, 15);
    __secondaryLabel.frame = frame;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



#pragma mark - getting Info
-(void) pullInfoFromObject:(id)object{
    __primaryLabel.text = @"Hey There";
    
}




@end
