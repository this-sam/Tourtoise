//
//  Tour.h
//  Tourtoise
//
//  Created by Austin Emmons on 12/6/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Stop;

@interface Tour : NSManagedObject

@property (nonatomic, retain) NSString * authors;
@property (nonatomic, retain) NSString * tourDescription;
@property (nonatomic, retain) NSString * tourTitle;
@property (nonatomic, retain) NSSet *stop;
@end

@interface Tour (CoreDataGeneratedAccessors)

- (void)addStopObject:(Stop *)value;
- (void)removeStopObject:(Stop *)value;
- (void)addStop:(NSSet *)values;
- (void)removeStop:(NSSet *)values;
@end
