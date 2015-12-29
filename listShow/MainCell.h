//
//  MainCell.h
//  listShow
//
//  Created by 叶永长 on 12/29/15.
//  Copyright © 2015 YYC. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol selectButtonDelegate <NSObject>

-(void)selectbutton:(UIButton *)sender;

@end

@interface MainCell : UITableViewCell
@property (nonatomic,strong) UIButton *selectButton;
@property (nonatomic,strong) NSString *buttonFlag;

@property (nonatomic,strong) UILabel *showView;
@property (nonatomic,strong) NSString *viewState;
@property (nonatomic,strong) id<selectButtonDelegate>delegate;
-(void)showData;
@end
