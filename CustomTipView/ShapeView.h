//
//  ShapeView.h
//  CustomTipView
//
//  Created by 张奥 on 2019/9/17.
//  Copyright © 2019年 张奥. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum : NSUInteger {
    top,
    bottom,
    left,
    right,
} Location;
@interface ShapeView : UIView
-(instancetype)initWithLocation:(Location)location;
@end
