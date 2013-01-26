//
//  MKProjectile.h
//  MKTowerDefence
//
//  Created by Murakei on 2013/01/20.
//  Copyright (c) 2013年 Murakei. All rights reserved.
//

#import "MKMoveObject.h"
#import "MKProjectileProtocol.h"
#import "MKTowerProtocol.h"
#import "MKCreepRepository.h"

/**
 * 弾クラス.
 * Towerのみ弾を発射する前提で作成.
 */
@interface MKProjectile : MKMoveObject <MKProjectileProtocol> {
    /**
     * 発射元のTower.
     * 不要かもしれないが、Towerを消去した瞬間に既に発射済みの弾に処置を行う,
     * 敵を倒した場合にTowerにExpを与えるなどを行う場合には必要か.
     */
    id<MKTowerProtocol> _tower;
    /**
     * Creepリポジトリへのリンク
     * 攻撃対象のCreepと爆発チェックする際に利用する.
     * 各Towerがリポジトリを持つことには抵抗があるが、とりあえず.
     */
    MKCreepRepository *_creepRepository;
    /**
     * Creepに当たったときに与えるダメージ
     */
    int _damage;
    /**
     * 爆発の射程距離
     */
    float _range;
    /**
     * 爆発したか否か
     */
    BOOL exploded;
}

@property(nonatomic, assign) id<MKTowerProtocol> tower;
@property(nonatomic, assign) MKCreepRepository *creepRepository;
@property(nonatomic, assign) float range;
@property(nonatomic, assign) int damage;
@property(nonatomic, assign) BOOL exploded;

/**
 * Projectileは初期位置のみ必須.
 */
- (id)initWithPoint:(MKPoint *)point;

@end
