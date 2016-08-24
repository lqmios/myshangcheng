//
//  ChooseCollrectionCell.h
//  mmmmm
//
//  Created by lqm on 16/8/10.
//  Copyright © 2016年 LQM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChooseCollrectionCell : UICollectionViewCell
@property(nonatomic,retain)UILabel * titleLab;
@property(nonatomic,retain)UIButton * SelectIconBtn;
@property (nonatomic,assign)BOOL isSelected;

-(void)UpdateCellWithState:(BOOL)select;

@end
