//
//  Tour.h
//  Tourtoise
//
//  Created by Austin Emmons on 12/5/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Stop;

@interface Tour : NSManagedObject

@property (nonatomic, retain) NSString      * authors;
@property (nonatomic, retain) NSString      * tourDescription;
@property (nonatomic, retain) NSString      * tourTitle;
@property (nonatomic, retain) NSSet         * relationship;
@end

@interface Tour (CoreDataGeneratedAccessors)

- (void)addRelationshipObject:(Stop *)value;
- (void)removeRelationshipObject:(Stop *)value;
- (void)addRelationship:(NSSet *)values;
- (void)removeRelationship:(NSSet *)values;
@end
