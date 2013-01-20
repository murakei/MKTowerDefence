//
//  MKCreepProtocol.h
//  MKTowerDefence
//
//  Created by Murakei on 2013/01/14.
//  Copyright (c) 2013年 Murakei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MKCourse.h"
#import "MKPoint.h"

@protocol MKCreepProtocol <NSObject>

// ------------------------------
// 必須
// ------------------------------
/**
 * 動作を行う.
 * 内容は与えられたコースなどによる.
 */
- (void)action;
/**
 * Creepが移動するコースを設定する.
 * 原則、Creep生成直後に設定し、変更することはない.
 */
- (void)setCourse:(MKCourse *)course;
/**
 * Creepを初期位置に設定する.
 * Creepを生成してすぐ表示するのは後で変更したくなるかもしれないので、
 * 生成と初期位置の設定を別メソッドにする.
 */
- (void)setStartPoint;
/**
 * ダメージを受ける
 */
- (void)damage:(int)damage;

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
* Creepのid(数値)を返します
*/
- (int)creepId;


@end
