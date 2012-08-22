//
//  FingerDrawingView.m
//  MiddleFingerDrawings
//
//  Created by Robert Carter on 8/21/12.
//  Copyright (c) 2012 Robert Carter. All rights reserved.
//

#import "FingerDrawingView.h"
#import "Line.h"

@interface FingerDrawingView()
@property (nonatomic) CGPoint start;
@property (nonatomic) CGPoint end;
@property (nonatomic) UIColor *color;
@property (strong, nonatomic) NSMutableArray *allLines;
@property (strong, nonatomic) Line *currentDrawing;
@property (nonatomic) BOOL currentlyDrawing;
@end

@implementation FingerDrawingView 

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    
    }
    return self;
}

- (void)awakeFromNib
{
   self.allLines = [NSMutableArray new];
}


- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
        
    // iterate through all ze lines and draw line.  Draw line good for glory of Russia line.
    for (Line *line in self.allLines) {
        [line drawLineWithContext:context];
    }
    if (self.currentlyDrawing) {
        [self.currentDrawing drawLineWithContext:context];
    }
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // capture the location where the user starts touching the view
    self.start = [[touches anyObject] locationInView:self];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    // Grab the current point
    self.currentlyDrawing = YES;
    self.end = [[touches anyObject] locationInView:self];
    self.color = [self randomColor];
    self.currentDrawing = [Line initWithStartPoint:self.start withEndPoint:self.end withColor:self.color];
    [self setNeedsDisplay];    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.end = [[touches anyObject] locationInView:self];
    self.color = [self randomColor];
    self.currentlyDrawing = NO;
    [self.allLines addObject:[Line initWithStartPoint:self.start withEndPoint:self.end withColor:self.color]];
    [self setNeedsDisplay];
}


-(float) randomIntensity {
    return arc4random() % 1100 * 0.001;
}

- (UIColor*) randomColor {
    return [UIColor colorWithRed:[self randomIntensity] green:[self randomIntensity]  blue:[self randomIntensity]  alpha:1];
}


- (BOOL) canBecomeFirstResponder {
    return YES;
}

- (void) motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (motion == UIEventSubtypeMotionShake) {
        NSLog(@"Device started shaking...");
        self.allLines = [NSMutableArray new];
        [self setNeedsDisplay];
    }
}


@end
