//
//  DaiGouModel.m
//  MyTestVC
//
//  Created by 杨飞 on 17/2/9.
//  Copyright © 2017年 wbb. All rights reserved.
//

#import "DaiGouModel.h"

@implementation DaiGouModel




+ (NSDictionary *)objectClassInArray{
    return @{@"DGListArray" : [DGListArrayModel class]};
}
@end



@implementation DGListArrayModel

+ (NSDictionary *)objectClassInArray{
    return @{@"goods" : [DGListGoodsModel class]};
}

@end


@implementation DGListRefModel

@end


@implementation DGListGoodsModel

@end


