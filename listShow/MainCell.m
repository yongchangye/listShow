//
//  MainCell.m
//  listShow
//
//  Created by 叶永长 on 12/29/15.
//  Copyright © 2015 YYC. All rights reserved.
//

#import "MainCell.h"

@implementation MainCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.selectButton = [[UIButton alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width-70, 5, 50, 15)];
        self.selectButton.backgroundColor = [UIColor redColor];
        self.selectButton.layer.cornerRadius = 5;
        self.selectButton.layer.masksToBounds = YES;
        self.selectButton.selected = NO;
        [self.selectButton setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
        [self.selectButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.selectButton];
        
        
        
    }
    return self;
}
-(void)buttonClick:(UIButton *)sender{
    UIView *view = (UIView *)[self viewWithTag:[sender.titleLabel.text intValue]];
    view.frame = CGRectMake(10, 5, 200, 30);
    if (self.delegate &&[self.delegate respondsToSelector:@selector(selectbutton:)]) {
        [self.delegate selectbutton:sender];
    }
}
-(void)showData{
    [self.selectButton setTitle:self.buttonFlag forState:UIControlStateNormal];
    self.showView = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, 200, 90)];
    self.showView.textColor = [UIColor redColor];
    if ([self.viewState isEqualToString:@"no"]) {
        self.showView.frame =CGRectMake(10, 5, 200, 30);
        self.showView.text = @"选中";
    }else{
        self.showView.frame = CGRectMake(10, 5, 200, 90);
        self.showView.text = @"未选中";
    }
    self.showView.backgroundColor = [UIColor grayColor];
    [self addSubview:self.showView];
    self.showView.tag = [self.buttonFlag intValue];
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
