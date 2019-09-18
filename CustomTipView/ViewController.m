//
//  ViewController.m
//  CustomTipView
//
//  Created by 张奥 on 2019/9/17.
//  Copyright © 2019年 张奥. All rights reserved.
//

#import "ViewController.h"
#import "TipView.h"
#import "Masonry.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    TipView *tipView = [[TipView alloc] initWithLocation:right];
    [self.view addSubview:tipView];
    [tipView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).with.offset(80);
        make.centerX.equalTo(self.view);
        make.height.mas_equalTo(@27);
        make.width.mas_equalTo(@168);
    }];
    [tipView layoutIfNeeded];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
