//
//  AppUnitl.h
//  XiaoShuoTool
//
//  Created by 曾富田 on 2017/5/11.
//  Copyright © 2017年 TheLastCode. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppModel.h"
@interface AppUnitl : NSObject

@property(nonatomic,strong) AppModel *ssmodel;
+ (AppUnitl *)sharedManager;

@end
