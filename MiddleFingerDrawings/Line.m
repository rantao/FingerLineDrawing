//
//  Line.m
//  MiddleFingerDrawings
//
//  Created by Robert Carter on 8/21/12.
//  Copyright (c) 2012 Robert Carter. All rights reserved.
//

#import "Line.h"

@implementation Line

+(Line*)initWithStartPoint:(CGPoint)start withEndPoint:(CGPoint)end withColor:(UIColor*)color
{
    Line *line = [Line new];
    line.start = start;
    line.finish = end;
    line.color = color;
    return line;
}

-(void)drawLineWithContext:(CGContextRef)context
{
    
    [self.color set];
    // Draw the lines in here
    CGContextMoveToPoint(context, self.start.x, self.start.y);
    
    CGContextSetLineWidth(context, 25.0);
    
    
    // Define strobe end point
    CGContextAddLineToPoint(context, self.finish.x, self.finish.y);
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextStrokePath(context);

}
@end
