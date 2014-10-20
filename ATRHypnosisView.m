//
//  ATRHypnosisView.m
//  Hypnomiser
//
//  Created by Leonard Bogdonoff on 10/17/14.
//  Copyright (c) 2014 New Public Art Foundation. All rights reserved.
//

#import "ATRHypnosisView.h"

@interface ATRHypnosisView()

@property (strong, nonatomic) UIColor *circleColor;

@end

@implementation ATRHypnosisView

- (void)drawRect:(CGRect)rect {
    CGRect bounds = self.bounds;
    
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20){
        [path moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
        
        [path  addArcWithCenter:center
                         radius:currentRadius
                     startAngle:0.0
                       endAngle:M_PI * 2.0
                      clockwise:YES];
    }
    
    path.lineWidth = 10;
    
    [self.circleColor setStroke];
    
    [path stroke];
    
    //    CGRect logoFrame = CGRectMake(bounds.size.width / 4.0, bounds.size.height / 5.0, bounds.size.width / 2.0, bounds.size.height / 2.0);
        
    //    UIImage *logoImage = [UIImage imageNamed:@"logo.png"];
    //    [logoImage drawInRect:logoFrame];
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if(self){
        self.circleColor = [UIColor lightGrayColor];
        self.backgroundColor = [UIColor clearColor];
    }
    
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@ was touched", self);
    
    float red = (arc4random() % 100) / 100.0;
    float green = (arc4random() % 100) / 100.0;
    float blue = (arc4random() % 100) / 100.0;

    UIColor *randomColor = [UIColor colorWithRed:red
                                           green:green
                                            blue:blue
                                           alpha:1.0];
    self.circleColor = randomColor;
}

-(void)setCircleColor:(UIColor *)circleColor
{
    _circleColor = circleColor;
    [self setNeedsDisplay];
}

@end
