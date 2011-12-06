//
//  Stop.h
//  Tourtoise
//
//  Created by Austin Emmons on 12/6/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Tour;

@interface Stop : NSManagedObject

@property (nonatomic, retain) NSString  * access;
@property (nonatomic, retain) NSString  * age;
@property (nonatomic, retain) NSString  * category;
@property (nonatomic, retain) NSString  * duration;
@property (nonatomic, retain) NSString  * stopDescription;
@property (nonatomic, retain) NSString  * title;
@property (nonatomic, retain) Tour      * inTour;

@end
