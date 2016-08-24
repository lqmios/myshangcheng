//
//  ChooseCollrectionCell.m
//  mmmmm
//
//  Created by lqm on 16/8/10.
//  Copyright © 2016年 LQM. All rights reserved.
//

#import "ChooseCollrectionCell.h"
#import "Masonry.h"
@implementation ChooseCollrectionCell
//自行绘制cell
-(id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self initView];
        
    }
    return self;
}

-(void)initView
{
    _SelectIconBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    //关闭事件属性
    _SelectIconBtn.userInteractionEnabled = NO;
    [_SelectIconBtn setBackgroundImage:[UIImage imageNamed:@"back_wxz"] forState:UIControlStateNormal];
     [_SelectIconBtn setBackgroundImage:[UIImage imageNamed:@"back_xz"] forState:UIControlStateSelected];
    
    [self.contentView addSubview:_SelectIconBtn];
    [_SelectIconBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.contentView.mas_left).offset(0);
        make.right.equalTo(self.contentView.mas_right).offset(0);
        make.top.equalTo(self.contentView.mas_top).offset(0);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(0);
        
    }];
    
    _titleLab = [[UILabel alloc]init];
    _titleLab.textColor = [UIColor redColor];
//    _titleLab.backgroundColor = [UIColor greenColor];
    _titleLab.font = [UIFont systemFontOfSize:16];
    _titleLab.textAlignment = NSTextAlignmentLeft;
    _titleLab.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_titleLab];
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.top.equalTo(self.mas_top);
        make.bottom.equalTo(self.mas_bottom);
    }];
    
    
    
    
}

//
-(void)UpdateCellWithState:(BOOL)select
{
    self.SelectIconBtn.selected = select;
    _isSelected = select;
}

@end
