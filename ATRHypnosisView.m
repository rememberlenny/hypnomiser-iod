//
//  ATRHypnosisView.m
//  Hypnomiser
//
//  Created by Leonard Bogdonoff on 10/17/14.
//  Copyright (c) 2014 New Public Art Foundation. All rights reserved.
//

#import "ATRHypnosisView.h"

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
    
    [[UIColor lightGrayColor] setStroke];
    
    [path stroke];
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if(self){
        self.backgroundColor = [UIColor clearColor];
    }
    
    return self;
}

@end
