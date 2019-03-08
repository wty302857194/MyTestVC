//
//  DaiGouModel.h
//  MyTestVC
//
//  Created by 杨飞 on 17/2/9.
//  Copyright © 2017年 wbb. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DGListArrayModel,DGListRefModel,DGListGoodsModel;
@interface DaiGouModel : NSObject

@property (nonatomic, strong) NSArray *DGListArray;

@end
@interface DGListArrayModel : NSObject

@property (nonatomic, copy) NSString *ref_sn_money;

@property (nonatomic, strong) DGListRefModel *ref;

@property (nonatomic, copy) NSString *t_money;

@property (nonatomic, assign) NSInteger pur_order_id;

@property (nonatomic, copy) NSString *total_price;

@property (nonatomic, strong) NSArray *goods;

@property (nonatomic, copy) NSString *create_time;

@property (nonatomic, copy) NSString *order_state;

@property (nonatomic, copy) NSString *pay_money;

@property (nonatomic, copy) NSString *order_code;

@property (nonatomic, copy) NSString *pur_type;

@end

@interface DGListRefModel : NSObject

@property (nonatomic, copy) NSString *pur_type;

@property (nonatomic, copy) NSString *total_price;

@property (nonatomic, assign) NSInteger pur_order_id;

@property (nonatomic, copy) NSString *nums;

@property (nonatomic, copy) NSString *create_time;

@property (nonatomic, copy) NSString *order_state;

@property (nonatomic, copy) NSString *goods_name;

@property (nonatomic, copy) NSString *order_code;

@property (nonatomic, copy) NSString *pay_money;

@end

@interface DGListGoodsModel : NSObject

@property (nonatomic, copy) NSString *goods_name;

@property (nonatomic, assign) NSInteger nums;

@end

