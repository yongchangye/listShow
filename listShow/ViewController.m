//
//  ViewController.m
//  listShow
//
//  Created by 叶永长 on 12/29/15.
//  Copyright © 2015 YYC. All rights reserved.
//

#import "ViewController.h"
#import "MainCell.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,selectButtonDelegate>
{
    UITableView *mainTableview;
    NSMutableDictionary *dataDic;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    mainTableview = [[UITableView alloc]initWithFrame:self.view.bounds];
    mainTableview.delegate = self;
    mainTableview.dataSource  =self;
    [self.view addSubview:mainTableview];
    dataDic = [[NSMutableDictionary alloc]init];
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([[dataDic objectForKey:[NSString stringWithFormat:@"%ld",indexPath.row+1]] isEqualToString:@"no"]) {
        return 40;
    }
    return 100;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *celldefine = @"celldefine";
    MainCell *cell = [tableView dequeueReusableCellWithIdentifier:celldefine];
    if (nil == cell) {
        cell = [[MainCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:celldefine];
    }
    for (UIView *view in cell.subviews) {
        if ([view isKindOfClass:[UIView class]] &&![view isKindOfClass:[UIButton class]]) {
            [view removeFromSuperview];
        }
    }
    cell.viewState = [dataDic objectForKey:[NSString stringWithFormat:@"%ld",indexPath.row+1]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.delegate =self;
    cell.buttonFlag = [NSString stringWithFormat:@"%ld",(long)indexPath.row+1];
    [cell showData];
    return cell;
}
-(void)selectbutton:(UIButton *)sender{
    if (sender.selected) {
        sender.selected = NO;
        [dataDic setObject:@"yes" forKey:sender.titleLabel.text];
    }else{
        sender.selected = YES;
        [dataDic setObject:@"no" forKey:sender.titleLabel.text];
    }
    [mainTableview reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
