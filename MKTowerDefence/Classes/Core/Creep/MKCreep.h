//
//  MKCreep.h
//  MKTowerDefence
//
//  Created by Murakei on 2013/01/14.
//  Copyright (c) 2013年 Murakei. All rights reserved.
//

#import "MKMoveObject.h"
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
    /**
     * 現在のヒットポイント
     */
    int currentHp;
}

@property(nonatomic, assign) int creepId;

@end
