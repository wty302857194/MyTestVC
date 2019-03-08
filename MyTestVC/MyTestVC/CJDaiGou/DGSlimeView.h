//
//  DGSlimeView.h
//  DGSlimeView
//
//  Created by 段昊宇 on 16/5/29.
//  Copyright © 2016年 Desgard_Duan. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^TuoZhuaiBlock)();
@interface DGSlimeView : UIView
@property(nonatomic,strong) TuoZhuaiBlock tuoZhuaiBlock;
@property(nonatomic,strong) UILabel *num_label;
- (void)initWithSupperView:(UIView *)backView withTuoZhuaiBlock:(TuoZhuaiBlock)block ;
@end
