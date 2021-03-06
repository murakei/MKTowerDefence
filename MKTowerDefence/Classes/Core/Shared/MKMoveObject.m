//
//  MKMoveObject.m
//  MKTowerDefence
//
//  Created by Murakei on 2013/01/14.
//  Copyright (c) 2013年 Murakei. All rights reserved.
//

#import "MKMoveObject.h"

@implementation MKMoveObject

@synthesize speed;
@synthesize rotateSpeed;

- (id)init {
    if (self = [super init]) {
        _currentPoint = nil;
        _targetPoint = nil;
        speed = 1;
        dx = 0;
        dy = 0;
        currentAngle = 0;
        targetAngle = 0;
        rotateSpeed = 1;
    }
    return self;
}
/**
 * ターゲットに向かってスピードに応じた距離を移動します
 * 新たにPointを生成する方法もあるが、メモリ管理に不安があるので座標を変更する.
 */
- (void)move {
    [_currentPoint addX:dx * speed andY:dy * speed];
}
/**
 * ターゲットに向かって向きを換えます
 */
- (void)rotate {
    currentAngle = targetAngle;
}
/**
 * ターゲットに向かって回転スピードに応じて向きを換えます
 */
- (void)rotateSmooth {
    float diff = targetAngle - currentAngle;
    if (diff == 0) {
        return;
    }
    while (diff > (float)M_PI) {
        diff -= (float)M_PI * 2;
    }
    while (diff < (float)-M_PI) {
        diff += (float)M_PI * 2;
    }
    if (diff > 0 && diff < (float)M_PI) {
        if (fabsf(diff) > rotateSpeed) {
            currentAngle += rotateSpeed;
        } else {
            currentAngle = targetAngle;
        }
    } else {
        if (fabsf(diff) > rotateSpeed) {
            currentAngle -= rotateSpeed;
        } else {
            currentAngle = targetAngle;
        }
    }
}
/**
 * 現在位置を設定します
 */
- (void)setCurrentPoint:(MKPoint *)point {
    _currentPoint = [point copy];
}
/**
 * 現在位置を返す
 * @return (MKPoint *)現在位置
 */
- (MKPoint *)currentPoint {
    return [[_currentPoint copy] autorelease];
}
/**
 * 目標位置を設定します
 * @param point 設定する目標位置の座標
 */
- (void)setTargetPoint:(MKPoint *)point {
    _targetPoint = [point copy];
}
/**
 * 目標位置を返す
 * @return (MKPoint *)目標位置
 */
- (MKPoint *)targetPoint {
    return [[_targetPoint copy] autorelease];
}
/**
 * 移動量を計算する
 */
- (void)calcMovement {
    float diff = [_currentPoint calcDistanceTo:_targetPoint];
    if (diff == 0) {
        dx = 0;
        dy = 0;
    }
    if (diff > speed) {
        dx = cosf(currentAngle);
        dy = sinf(currentAngle);
    } else {
        dx = [_targetPoint x] - [_currentPoint x];
        dy = [_targetPoint y] - [_currentPoint y];
    }
}
/**
 * 目標角度を計算する
 */
- (void)calcAngle {
    if (_targetPoint == nil) {
        targetAngle = currentAngle;
    } else {
        targetAngle = [_currentPoint calcAngleTo:_targetPoint];
    }
}
/**
 * 現在の角度を返す
 * @return (float)現在の角度
 */
- (float)currentAngle {
    return currentAngle;
}

@end
