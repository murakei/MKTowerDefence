//
//  MKMoveObject.h
//  MKTowerDefence
//
//  Created by Murakei on 2013/01/14.
//  Copyright (c) 2013年 Murakei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MKPoint.h"

@interface MKMoveObject : NSObject {
    /**
     * 現在位置
     */
    MKPoint *_currentPoint;
    /**
     * 目標位置
     */
    MKPoint *_targetPoint;
    /**
     * 移動スピード
     */
    float speed;
    /**
     * 移動量
     */
    float dx, dy;
    /**
     * 現在の角度
     */
    float currentAngle;
    /**
     * 目標の角度
     */
    float targetAngle;
    /**
     * 回転スピード
     */
    float rotateSpeed;
}

@property(nonatomic, assign) float speed;
@property(nonatomic, assign) float rotateSpeed;

/**
 * ターゲットに向かってスピードに応じた距離を移動する
 */
- (void)move;
/**
 * ターゲットに向かって向きを換える
 */
- (void)rotate;
/**
 * ターゲットに向かって回転スピードに応じて向きを換える
 */
- (void)rotateSmooth;
/**
 * 現在位置を設定する
 * @param point 設定する座標
 */
- (void)setCurrentPoint:(MKPoint *)point;
/**
 * 現在位置を返す
 * @return (MKPoint *)現在位置
 */
- (MKPoint *)currentPoint;
/**
 * 目標位置を設定する
 * @param point 設定する目標位置の座標
 */
- (void)setTargetPoint:(MKPoint *)point;
/**
 * 目標位置を返す
 * @return (MKPoint *)目標位置
 */
- (MKPoint *)targetPoint;
/**
 * 移動量を計算する
 */
- (void)calcMovement;
/**
 * 目標角度を計算する
 */
- (void)calcAngle;

@end
