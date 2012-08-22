//
//  Line.h
//  MiddleFingerDrawings
//
//  Created by Robert Carter on 8/21/12.
//  Copyright (c) 2012 Robert Carter. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Line : NSObject
@property CGPoint start;
@property CGPoint finish;
@property UIColor *color;
+(Line*)initWithStartPoint:(CGPoint)start withEndPoint:(CGPoint)end withColor:(UIColor*)color;
-(void)drawLineWithContext:(CGContextRef)context;
@end
