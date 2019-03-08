//
//  SearchResultModel.h
//  MyTestVC
//
//  Created by wbb on 2017/11/16.
//  Copyright © 2017年 wbb. All rights reserved.
//

#import <Foundation/Foundation.h>
@class GoodsListModel,GoodsTypeListModel;
@interface SearchResultModel : NSObject
@property (nonatomic, copy) NSString *phone;
@property (nonatomic, copy) NSString *state;
@property (nonatomic, strong) NSArray *goodsTypeList;
@property (nonatomic, assign) BOOL isFlex;
@property (nonatomic, assign) NSInteger cellHeight;
@end

@interface GoodsTypeListModel : NSObject
@property (nonatomic, copy) NSString *goodsType;
@property (nonatomic, copy) NSString *goodsTypeName;//
@property (nonatomic, copy) NSString *amount;
@property (nonatomic, strong) NSArray *goodsList;
@property (nonatomic, assign) BOOL isFlex;
@property (nonatomic, assign) NSInteger cellHeight;
@end

@interface GoodsListModel : NSObject
@property (nonatomic, copy) NSString *goodsName;
@property (nonatomic, copy) NSString *num;//
@property (nonatomic, copy) NSString *property;
@property (nonatomic, copy) NSString *unit;
@property (nonatomic, assign) BOOL isFlex;
@property (nonatomic, assign) NSInteger cellHeight;
@end
