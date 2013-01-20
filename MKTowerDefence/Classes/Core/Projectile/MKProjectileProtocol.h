//
//  MKProjectileProtocol.h
//  MKTowerDefence
//
//  Created by Murakei on 2013/01/20.
//  Copyright (c) 2013年 Murakei. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MKPoint;

@protocol MKProjectileProtocol <NSObject>

// ------------------------------
// 必須
// ------------------------------
/**
 * 動作を行う.
 * 動作内容は最初にセットした方向にひたすら進む.
 * 途中で敵が射程距離内に入った場合は爆発する.
 * そうでない場合は画面外に出ると消える.
 */
- (void)action;
/**
 * 弾が爆発したかチェックする
 */
- (void)checkExploded;

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


@end
