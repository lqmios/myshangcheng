//
//  SingleChooseCollectview.m
//  MulChooseDemo
//
//  Created by L2H on 16/7/13.
//  Copyright © 2016年 ailk. All rights reserved.
//

#import "SingleChooseCollectview.h"
#import "ChooseCollrectionCell.h"
#define ItemHeight 70
#define HeaderHeight 50
#define  SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define  SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

#define ColorRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]



static NSString *CellId = @"CellId";
static NSString *HeaderId = @"HeaderId";
@implementation SingleChooseCollectview


+(instancetype)ShareCollectviewWithFrame:(CGRect)frame{
    SingleChooseCollectview * collect = [[SingleChooseCollectview alloc] initWithCollectFrame:frame];
    return  collect;
}

-(instancetype)initWithCollectFrame:(CGRect)frame{
    self = [super init];
    if(self){
        self.frame = frame;
        [self CreateCollectView];
    }
    return self;
}


-(void)CreateCollectView{
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumInteritemSpacing = 0;//列距
    flowLayout.minimumLineSpacing = 10;
    _MyCollectView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0 ,SCREEN_WIDTH, self.frame.size.height) collectionViewLayout:flowLayout];
//    _MyCollectView.backgroundColor = ColorRGB(0xf7f7f7);
    _MyCollectView.backgroundColor = [UIColor whiteColor];
    [_MyCollectView registerClass:[ChooseCollrectionCell class] forCellWithReuseIdentifier:CellId];
    _MyCollectView.showsVerticalScrollIndicator = NO;
    _MyCollectView.scrollEnabled = YES;
    _MyCollectView.delegate = self;
    _MyCollectView.dataSource = self;
    [self addSubview:_MyCollectView];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _dataArr.count;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

//元素大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake((SCREEN_WIDTH - 40)/3,ItemHeight);
    
    //    return CGSizeMake(SCREEN_WIDTH/9,ItemHeight);
}
//设置cell与边缘的间隔
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    UIEdgeInsets inset = UIEdgeInsetsMake(10, 10, 10, 10);
    return inset;
}

//最小行间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}

//最小列间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}



- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSString *reuseIdetify = CellId;
    ChooseCollrectionCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdetify forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    cell.titleLab.text = [_dataArr objectAtIndex:indexPath.row];
    
    //    if (_ifAllSelecteSwitch) {
    //        [cell UpdateCellWithState:_ifAllSelected];
    //        if (indexPath.row == _dataArr.count-1) {
    //            _ifAllSelecteSwitch  = NO;
    //        }
    //    }
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (_currentSelectIndex!=nil&&_currentSelectIndex != indexPath) {
        ChooseCollrectionCell * cell = (ChooseCollrectionCell *)[collectionView cellForItemAtIndexPath:_currentSelectIndex];
        [cell UpdateCellWithState:NO];
    }
    ChooseCollrectionCell * cell = (ChooseCollrectionCell *)[collectionView cellForItemAtIndexPath:indexPath];
    [cell UpdateCellWithState:!cell.isSelected];
    _currentSelectIndex = indexPath;
    
    _block(cell.titleLab.text,indexPath);
}

-(void)ReloadData{
    [self.MyCollectView reloadData];
}

@end






















