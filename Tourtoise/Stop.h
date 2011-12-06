//
//  Stop.h
//  Tourtoise
//
//  Created by Austin Emmons on 12/5/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Stop : NSManagedObject

@property (nonatomic, retain) NSString          * access;
@property (nonatomic, retain) NSString          * age;
@property (nonatomic, retain) NSString          * category;
@property (nonatomic, retain) NSString          * duration;
@property (nonatomic, retain) NSString          * stopDescription;
@property (nonatomic, retain) NSString          * title;
@property (nonatomic, retain) NSManagedObject   *relationship;

@end
