//
//  ViewController.m
//  mmmmm
//
//  Created by lqm on 16/8/10.
//  Copyright © 2016年 LQM. All rights reserved.
//

#import "ViewController.h"
#import "SingleChooseCollectionView.h"

@interface ViewController ()
{
    NSString *string;
}
@property (weak, nonatomic) IBOutlet UILabel *calculateLbl;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;

@property (weak, nonatomic) IBOutlet UIButton *jianBtn;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)jianBtnClick:(id)sender {
    
    
    int num = [self.calculateLbl.text intValue];
    num -= 1;
    if (num <= 0) {
        return;
    }
    else
    {
        self.calculateLbl.text = [NSString stringWithFormat:@"%d",num];
    }
    
}

- (IBAction)addBtnClick:(id)sender {
    int num = [self.calculateLbl.text intValue];
    num += 1;
    self.calculateLbl.text = [NSString stringWithFormat:@"%d",num];
    
    
}
- (IBAction)sureBtnAction:(id)sender {
    string = self.calculateLbl.text;
    NSLog(@"%@",string);
}

- (IBAction)pushAction:(id)sender {
    
    SingleChooseCollectionView *sing = [[SingleChooseCollectionView alloc]init];
    [self.navigationController pushViewController:sing animated:YES];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end











