//
//  Animator.m
//  tours
//
//  Created by Austin Emmons on 11/22/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "Animator.h"

@implementation Animator

static float aDuration = .5;
static float aDelay = 0;


+(void) duration:(float)t
{
    aDuration = t;
}

+(void) delay:(float)d
{
    aDelay = d;
}

+(void) duration:(float)t delay:(float)d
{
    aDuration = t;
    aDelay = d;
}




+(void) horizontalShift:(UIView *)view distance:(float)d
{
              //get frame of view we are working with
    
    // begin animation block
//    [UIView beginAnimations:@"horizontalShift" context:nil];
//    
//    frame.origin.x = frame.origin.x + d;            //  shift the temprorary frame a distance of d
//                        // NOTE: if d < 0 shift will occur in left direction
//    view.frame = frame;                             //  commit this changes by resetting original view
//    
//    // end animation block
//    [UIView commitAnimations];
    
    NSLog(@"Inside horizontal shift distance ::  %4.2f", d);
    
    [UIView animateWithDuration:aDuration delay:aDelay options:UIViewAnimationCurveEaseInOut 
            animations:^{
                CGRect frame = view.frame;
                frame.origin.x = frame.origin.x+d;
//                frame = CGRectMake(frame.origin.x + d, frame.origin.y, frame.size.width, frame.size.width);          //  shift the temprorary frame a distance of d
                // NOTE: if d < 0 shift will occur in left direction
                view.frame = frame;                             //  commit this changes by resetting original view
            }completion:^(BOOL finished){
                
    }];
    

}

+(void) verticalShift:(UIView *)view distance:(float)d
{
    NSLog(@"Inside vertical shift distance ::  %4.2f", d);
    
    [UIView animateWithDuration:aDuration delay:aDelay options:UIViewAnimationCurveEaseInOut 
                     animations:^{
                         CGRect frame = view.frame;
                         frame.origin.y = frame.origin.y+d;
                         //                frame = CGRectMake(frame.origin.x + d, frame.origin.y, frame.size.width, frame.size.width);          //  shift the temprorary frame a distance of d
                         // NOTE: if d < 0 shift will occur in left direction
                         view.frame = frame;                             //  commit this changes by resetting original view
                     }completion:^(BOOL finished){
                         
                     }];
}


@end
