//
//  TYLianXiViewController.h
//  MyTestVC
//
//  Created by wbb on 2017/8/10.
//  Copyright © 2017年 wbb. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol TYDelegate <NSObject>

@optional
- (void)getData;

@required
- (void)getRequest;

@end

@interface TYLianXiViewController : UIViewController

@property (nonatomic, weak) id <TYDelegate> delegate;
@end
