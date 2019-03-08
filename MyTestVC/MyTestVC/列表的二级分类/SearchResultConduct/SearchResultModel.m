//
//  SearchResultModel.m
//  MyTestVC
//
//  Created by wbb on 2017/11/16.
//  Copyright © 2017年 wbb. All rights reserved.
//

#import "SearchResultModel.h"

@implementation SearchResultModel
+ (NSDictionary *)objectClassInArray{
    return @{@"goodsTypeList" : [GoodsTypeListModel class]};
}
@end

@implementation GoodsTypeListModel
+ (NSDictionary *)objectClassInArray{
    return @{@"goodsList" : [GoodsListModel class]};
}
@end
@implementation GoodsListModel

@end

