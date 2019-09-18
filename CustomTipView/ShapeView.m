//
//  ShapeView.m
//  CustomTipView
//
//  Created by 张奥 on 2019/9/17.
//  Copyright © 2019年 张奥. All rights reserved.
//

#import "ShapeView.h"
@interface ShapeView()
@property (nonatomic, assign) Location location;
@end
@implementation ShapeView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithLocation:(Location)location{
    self = [super init];
    if (self) {
        self.location = location;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

-(void)drawRect:(CGRect)rect{
    [self drawShape];
}
-(void)drawShape{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextBeginPath(context);
    CGPoint startPoint = CGPointMake(0, 0);
    CGPoint middlePoint = CGPointMake(0, 0);
    CGPoint endPoint = CGPointMake(0, 0);
    switch (self.location) {
        case top:{
            startPoint = CGPointMake(0, self.frame.size.height);
            middlePoint = CGPointMake(self.frame.size.width / 2, self.frame.size.height/2);
            endPoint = CGPointMake(self.frame.size.width, self.frame.size.height);
        }
            break;
        case bottom:{
            startPoint = CGPointMake(0, 0);
            middlePoint = CGPointMake(self.frame.size.width / 2, self.frame.size.height/2);
            endPoint = CGPointMake(self.frame.size.width, 0);
        }
            break;
        case left:{
            startPoint = CGPointMake(self.frame.size.width, 0);
            middlePoint = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
            endPoint = CGPointMake(self.frame.size.width, self.frame.size.height);
        }
            break;
        case right:{
            startPoint = CGPointMake(0, 0);
            middlePoint = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
            endPoint = CGPointMake(0, self.frame.size.height);
        }
            break;
            
        default:
            break;
    }
    CGContextMoveToPoint(context, startPoint.x, startPoint.y);
    CGContextAddLineToPoint(context, middlePoint.x, middlePoint.y);
    CGContextAddLineToPoint(context, endPoint.x, endPoint.y);
    CGContextClosePath(context);
    [[UIColor blueColor] setFill];
    [[UIColor blueColor] setStroke];
    CGContextDrawPath(context, kCGPathFillStroke);
}


@end
