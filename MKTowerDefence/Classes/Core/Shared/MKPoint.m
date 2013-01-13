//
//  MKPoint.m
//  MKTowerDefence
//
//  Created by Muradome on 2013/01/14.
//  Copyright (c) 2013年 Murakei. All rights reserved.
//

#import "MKPoint.h"

@implementation MKPoint

/**
 * 新しいインスタンスを生成する
 */
+ (MKPoint *)createWithX:(float)x andY:(float)y {
    MKPoint *p = [[MKPoint alloc] init];
    p->_point = CGPointMake(x, y);
    return p;
}

@end
