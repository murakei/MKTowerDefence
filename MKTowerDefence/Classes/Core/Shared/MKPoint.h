//
//  MKPoint.h
//  MKTowerDefence
//
//  Created by Murakei on 2013/01/14.
//  Copyright (c) 2013年 Murakei. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * ２次元平面における座標を表すクラス.
 * ２点間の距離の計算、角度の計算などを行う.
 */
@interface MKPoint : NSObject <NSCopying> {
    /**
     * 座標を表す
     */
    CGPoint _point;
}
- (id)copyWithZone:(NSZone *)zone;

/**
 * 新しいインスタンスを生成する
 * @param x 座標のX方向の値
 * @param y 座標のY方向の値
 */
+ (MKPoint *)createWithX:(float)x andY:(float)y;
/**
 * ２点間の距離を計算する
 * @param target
 * @return (float)距離
 */
- (float)calcDistanceTo:(MKPoint *)target;
/**
 * ２点間の角度を計算する
 * @param target
 * @return (float)角度(ラジアン)
 */
- (float)calcAngleTo:(MKPoint *)target;
/**
 * 座標を比較する
 * @param target 比較対象の座標
 * @return YES:一致, NO:不一致
 */
- (BOOL)compareTo:(MKPoint *)target;
/**
 * 座標を変更する
 * @param dx X方向の増分
 * @param dy Y方向の増分
 */
- (void)addX:(float)dx andY:(float)dy;
/**
 * X座標の位置を返す
 * @return (float)X座標の位置
 */
- (float)x;
/**
 * Y座標の位置を返す
 * @return (float)Y座標の位置
 */
- (float)y;

@end
