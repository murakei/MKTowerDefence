//
//  MKTowerProtocol.h
//  MKTowerDefence
//
//  Created by Murakei on 2013/01/20.
//  Copyright (c) 2013年 Murakei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MKProjectileProtocol.h"

@class MKPoint;

@protocol MKTowerProtocol <NSObject>

// ------------------------------
// 必須
// ------------------------------
/**
 * 動作を行う.
 * 動作内容は接近するCreepなどによる.
 */
- (void)action;
/**
 * 射程距離内の敵が存在する場合、弾を発射します
 */
- (id<MKProjectileProtocol>)shoot;

// ------------------------------
// 位置関係
// ------------------------------
/**
 * 現在位置を返します
 */
- (MKPoint *)currentPoint;
/**
 * 目標位置を返します
 */
- (MKPoint *)targetPoint;

// ------------------------------
// 基本パラメータ取得／設定
// ------------------------------
/**
 * 一意に識別するIDを返します
 */
- (int)towerId;

@end
