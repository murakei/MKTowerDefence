//
//  MKTower.m
//  MKTowerDefence
//
//  Created by Murakei on 2013/01/14.
//  Copyright (c) 2013年 Murakei. All rights reserved.
//

#import "MKTower.h"
#import "MKProjectile.h"

@interface MKTower()

/**
 * 射程距離圏内のCreepを取得する
 */
- (id<MKCreepProtocol>)searchTarget;
/**
 * 射程距離圏内から取得したCreepから攻撃対象とする１体を選ぶ
 */
- (id<MKCreepProtocol>)pickupTarget:(NSMutableArray *)targetList;

@end

@implementation MKTower

- (id)init {
    if (self = [super init]) {
        [self setCurrentPoint:[MKPoint createWithX:0 andY:0]];
        [self setTargetPoint:nil];
        towerId = 1;
    }
    return self;
}
/**
 * 動作を行う.
 * 動作内容は接近するCreepなどによる.
 */
- (void)action {
    // ターゲットを探します
    _targetCreep = [self searchTarget];

    // ターゲットが設定されている場合、ターゲットに向かって回転する
    if (_targetCreep != nil) {
        [self setTargetPoint:[_targetCreep currentPoint]];
        [self calcAngle];
        [self rotate];
    }
}
/**
 * 射程距離内の敵が存在する場合、弾を発射します
 */
- (id<MKProjectileProtocol>)shoot {
    if ([self targetPoint] == nil) {
        return nil;
    }
    return [[MKProjectile alloc] init];
}
/**
 * 一意に識別するIDを返します
 */
- (int)towerId {
    return towerId;
}
/**
 * 射程距離を設定します
 */
- (void)setRange:(float)range {
    _range = range;
}
/**
 * Creepリポジトリへのリンクを設定する
 */
- (void)setCreepRepository:(MKCreepRepository *)creepRepository {
    _creepRepository = creepRepository;
}



/**
 * 射程距離圏内のCreepを取得する
 * @return Creep一体
 */
- (id<MKCreepProtocol>)searchTarget {
    if (_creepRepository == nil) {
        return nil;
    }
    NSArray *list = [_creepRepository findAll];
    NSMutableArray *targetList = [[NSMutableArray alloc] init];

    for (int i = 0; i < [list count]; i++) {
        id<MKCreepProtocol> creep = [list objectAtIndex:i];
        float distance = [[creep currentPoint] calcDistanceTo:[self currentPoint]];
        if (_range >= distance) {
            [targetList addObject:creep];
        }
    }
    if ([targetList count] > 0) {
        return [self pickupTarget:targetList];
    }
    return nil;
}
/**
 * 射程距離圏内から取得したCreepから攻撃対象とする１体を選ぶ
 */
- (id<MKCreepProtocol>)pickupTarget:(NSMutableArray *)targetList {
    int targetIndex = -1;
    int minimumCreepNo = 999;
    for (int i = 0; i < [targetList count]; i++) {
        id<MKCreepProtocol> creep = [targetList objectAtIndex:i];
        if (minimumCreepNo > [creep creepId]) {
            minimumCreepNo = [creep creepId];
            targetIndex = i;
        }
    }
    if (targetIndex == -1) {
        return nil;
    }
    return [targetList objectAtIndex:targetIndex];
}

@end
