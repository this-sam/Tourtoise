//
//  TtManagedObjectContextManager.h
//  Tourtoise
//
//  Created by Austin Emmons on 12/5/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface TtManagedObjectContextManager : NSObject


-(id) initWithContext:(NSManagedObjectContext *)context;


+ (NSManagedObjectContext *) managedObjectContext;
@end
