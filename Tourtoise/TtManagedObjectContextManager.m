//
//  TtManagedObjectContextManager.m
//  Tourtoise
//
//  Created by Austin Emmons on 12/5/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "TtManagedObjectContextManager.h"

static NSManagedObjectContext *managedObjectContext;        

@implementation TtManagedObjectContextManager

- (id)initWithContext:(NSManagedObjectContext *)context     
//      This should be called from TtAppDelegate
{
    if (self = [super init]) {
        
        managedObjectContext = context;
        
    }
    return self;
}

+ (NSManagedObjectContext *) managedObjectContext
{
    return managedObjectContext;
}

@end
