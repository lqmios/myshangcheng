//
//  SingleChooseCollectionView.m
//  mmmmm
//
//  Created by lqm on 16/8/10.
//  Copyright © 2016年 LQM. All rights reserved.
//

#import "SingleChooseCollectionView.h"
#import "SingleChooseCollectview.h"
#define  SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define  SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define ItemHeight 70
@interface SingleChooseCollectionView ()
{
    SingleChooseCollectview * MyCollectView;
    NSMutableArray * dataArr;

}

@end

@implementation SingleChooseCollectionView

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    dataArr = [[NSMutableArray alloc]initWithCapacity:0];
    dataArr = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9", nil];
    MyCollectView = [SingleChooseCollectview ShareCollectviewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.view.frame.size.height)];
    MyCollectView.dataArr = dataArr;
    //选中内容
    MyCollectView.block = ^(NSString *chooseContent,NSIndexPath *indexPath){
        
        NSLog(@"数据：%@ ；第%ld行",chooseContent,indexPath.row);
        
    };
    [self.view addSubview:MyCollectView];
}


#pragma mark --UICollectionViewDataSource,UICollectionViewDelegate--





















- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end






























