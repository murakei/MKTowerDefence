//
//  MKTowerProtocol.h
//  MKTowerDefence
//
//  Created by Muradome on 2013/01/20.
//  Copyright (c) 2013年 Murakei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MKProjectileProtocol.h"

@class MKPoint;

@protocol MKTowerProtocol <NSObject>

/**
 * 動作を行う.
 * 動作内容は接近するCreepなどによる.
 */
- (void)action;
/**
 * 射程距離内の敵が存在する場合、弾を発射します
 */
- (id<MKProjectileProtocol>)shoot;
/**
 * 現在位置を返します
 */
- (MKPoint *)currentPoint;
/**
 * 目標位置を返します
 */
- (MKPoint *)targetPoint;
/**
 * 一意に識別するIDを返します
 */
- (int)towerId;

@end
