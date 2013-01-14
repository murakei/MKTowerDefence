//
//  MKPoint.m
//  MKTowerDefence
//
//  Created by Murakei on 2013/01/14.
//  Copyright (c) 2013年 Murakei. All rights reserved.
//

#import "MKPoint.h"

@implementation MKPoint

/**
 *
 */
- (id)init {
    if (self = [super init]) {
        _point = CGPointZero;
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone {
    MKPoint *p = [[MKPoint allocWithZone:zone] init];
    if (p) {
        p->_point = CGPointMake(_point.x, _point.y);
    }
    return p;
}

/**
 * 新しいインスタンスを生成する
 */
+ (MKPoint *)createWithX:(float)x andY:(float)y {
    MKPoint *p = [[MKPoint alloc] init];
    p->_point = CGPointMake(x, y);
    return p;
}

/**
 * ２点間の距離を計算する.
 * targetにnilが与えられた場合は例外ではなく0を返す
 * @param target
 * @return (float)距離
 */
- (float)calcDistanceTo:(MKPoint *)target {
    if (target == nil) {
        return 0;
    }
    return sqrtf(pow(target->_point.x - _point.x, 2)
                 + pow(target->_point.y - _point.y, 2));
}
/**
 * ２点間の角度を計算する
 * @param target
 * @return (float)角度(ラジアン)
 */
- (float)calcAngleTo:(MKPoint *)target {
    if (target == nil) {
        return 0;
    }
    float offX = target->_point.x - _point.x;
    float offY = target->_point.y - _point.y;
    float angleRadians = 0;
    if (offX > 0) {
        angleRadians = atanf(offY / offX);
    } else if (offX < 0) {
        angleRadians = M_PI - atanf(offY / -offX);
    } else {
        if (offY > 0) {
            angleRadians = M_PI_2;
        } else if (offY < 0) {
            angleRadians = -M_PI_2;
        }
    }
    while (angleRadians > (float)M_PI) {
        angleRadians -= (float)M_PI * 2;
    }
    while (angleRadians < -(float)M_PI) {
        angleRadians += (float)M_PI * 2;
    }
    return angleRadians;
}
/**
 * 座標を比較します
 * @param target 比較対象の座標
 * @return YES:一致, NO:不一致
 */
- (BOOL)compareTo:(MKPoint *)target {
    if (target == nil) {
        return NO;
    }
    return [self calcDistanceTo:target] == 0;
}
/**
 * 座標を変更する
 * @param dx X方向の増分
 * @param dy Y方向の増分
 */
- (void)addX:(float)dx andY:(float)dy {
    _point = CGPointMake(_point.x + dx, _point.y + dy);
}
/**
 * X座標の位置を返す
 * @return (float)X座標の位置
 */
- (float)x {
    return _point.x;
}
/**
 * Y座標の位置を返す
 * @return (float)Y座標の位置
 */
- (float)y {
    return _point.y;
}

@end
