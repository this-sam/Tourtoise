//
//  Animator.h
//  tours
//
//  Created by Austin Emmons on 11/22/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

//****  Description

// Static class that will handle all view animations
//
//
//
//
//
//

@interface Animator : NSObject



+ (void) duration:(float) t;
+ (void) delay:(float) d;
+ (void) duration:(float)t delay:(float) d;


+ (void) horizontalShift:(UIView *)view distance:(float)d;
                                            // positive will be to the right
+ (void) verticalShift:(UIView *)view distance:(float)d;
                                            // positive will be down



@end
