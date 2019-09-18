//
//  TipView.m
//  CustomTipView
//
//  Created by 张奥 on 2019/9/17.
//  Copyright © 2019年 张奥. All rights reserved.
//

#import "TipView.h"
#import "Masonry.h"
@interface TipView()
@property (nonatomic, assign) Location location;
@property (nonatomic, strong) ShapeView *shapView;
@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIButton *button;
@end
@implementation TipView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {Masonry
    // Drawing code
}
*/

-(ShapeView*)shapView{
    if (!_shapView) {
        _shapView = [[ShapeView alloc] initWithLocation:self.location];
        [self addSubview:_shapView];
    }
    return _shapView;
}
-(UIView *)bgView{
    if (!_bgView) {
        _bgView = [[UIView alloc] init];
        _bgView.backgroundColor = [UIColor blueColor];
        _bgView.layer.masksToBounds = YES;
        _bgView.layer.cornerRadius = 3;
        [self addSubview:_bgView];
    }
    return _bgView;
}

-(UILabel *)label{
    if (!_label) {
        _label = [[UILabel alloc] init];
        _label.textColor = [UIColor whiteColor];
        _label.font = [UIFont systemFontOfSize:12.f];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.text = @"20级用户才能体验国王权限";
        [_bgView addSubview:_label];
    }
    return _label;
}

-(UIButton *)button{
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        [_button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        [_bgView addSubview:_button];
    }
    return _button;
}

-(instancetype)initWithLocation:(Location)location{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.location = location;
    }
    return self;
}

-(void)layoutSubviews{
    [self setUpUI];
}

-(void)clickButton:(UIButton *)button{
    if ([self.delegate respondsToSelector:@selector(clickTipView)]) {
        [self.delegate clickTipView];
    }
}

-(void)setUpUI{
    CGRect rect = CGRectMake(0, 0, 0, 0);
    if (self.location == top) {
        rect = CGRectMake((self.frame.size.width - 10)/2.f, 0, 10, 10);
    }else if (self.location == bottom){
        rect = CGRectMake((self.frame.size.width - 10)/2.f, self.frame.size.height - 10, 10, 10);
    }else if (self.location == left){
        rect = CGRectMake(0, (self.frame.size.height - 10)/2.f, 10, 10);
    }else if (self.location == right){
        rect = CGRectMake(self.frame.size.width - 10, (self.frame.size.height - 10)/2.f, 10, 10);
    }
    self.shapView.frame = rect;
    if (self.location == top) {
        [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.shapView.mas_bottom);
            make.bottom.left.right.equalTo(self);
        }];
    }else if (self.location == bottom){
        [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.shapView.mas_top);
            make.left.right.top.equalTo(self);
        }];
    }else if (self.location == left){
        [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.shapView.mas_right);
            make.right.top.bottom.equalTo(self);
        }];
    }else if (self.location == right){
        [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.shapView.mas_left);
            make.top.bottom.left.equalTo(self);
        }];
    }
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.bgView);
    }];
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.bgView);
    }];
    [self.shapView layoutIfNeeded];
}

@end
