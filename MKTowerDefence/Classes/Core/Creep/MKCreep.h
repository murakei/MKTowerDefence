//
//  MKCreep.h
//  MKTowerDefence
//
//  Created by Murakei on 2013/01/14.
//  Copyright (c) 2013年 Murakei. All rights reserved.
//

#import "MKMoveObject.h"
#import "MKCourse.h"
#import "MKCreepProtocol.h"

/**
 * ゲームの敵に相当するCreepの基本クラス
 * ゲームステージごとに定義された移動順を表すコースを保持し、
 * コースに沿って移動を行う.
 * 攻撃を行うことはなく、コースの最終地点に到達することでプレイヤーのライフを減らす.
 */
@interface MKCreep : MKMoveObject <MKCreepProtocol> {
    /**
     * creepを一意に識別するid
     */
    int creepId;
    /**
     *
     */
    MKCourse *_course;
    /**
     * コースの最終地点に到達しているか否かを表す
     */
    BOOL reachFinalDestination;
}

@property(nonatomic, assign) int creepId;

/**
 * Creepが移動するコースを設定する.
 * 原則、Creep生成直後に設定し、変更することはない.
 */
- (void)setCourse:(MKCourse *)course;
/**
 * 動作を行う.
 * 内容は与えられたコースなどによる.
 */
- (void)action;

@end
