//
//  MKTower.h
//  MKTowerDefence
//
//  Created by Muradome on 2013/01/14.
//  Copyright (c) 2013年 Murakei. All rights reserved.
//

#import "MKMoveObject.h"
#import "MKCreepProtocol.h"
#import "MKCreepRepository.h"

/**
 * Creepを攻撃するTowerクラス.
 */
@interface MKTower : MKMoveObject {
    /**
     * 攻撃対象のCreep
     */
    id<MKCreepProtocol> _targetCreep;
    /**
     * Creepリポジトリへのリンク
     * 攻撃対象のCreepを探索する際に利用する.
     * 各Towerがリポジトリを持つことには抵抗があるが、とりあえず.
     */
    MKCreepRepository *_creepRepository;
    /**
     * 射程距離
     */
    float range;
}
/**
 * 動作を行う.
 * 動作内容は接近するCreepなどによる.
 */
- (void)action;

@end
