//
//  TipView.h
//  CustomTipView
//
//  Created by 张奥 on 2019/9/17.
//  Copyright © 2019年 张奥. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShapeView.h"
@protocol TipViewDelegate<NSObject>

@optional
-(void)clickTipView;

@end
@interface TipView : UIView
-(instancetype)initWithLocation:(Location)location;
@property (nonatomic, weak) id<TipViewDelegate>delegate;
@end
