//
//  MKTower.m
//  MKTowerDefence
//
//  Created by Muradome on 2013/01/14.
//  Copyright (c) 2013年 Murakei. All rights reserved.
//

#import "MKTower.h"

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
- (id<MKCreepProtocol>)searchTarget {
    NSArray *list = [_creepRepository findAll];
    NSMutableArray *targetList = [[NSMutableArray alloc] init];

    for (int i = 0; i < [list count]; i++) {
        id<MKCreepProtocol> creep = [list objectAtIndex:i];
        float distance = [[creep currentPoint] calcDistanceTo:[self currentPoint]];
        if (range >= distance) {
            [targetList addObject:creep];
        }
    }
    if ([targetList count] > 0) {
        return [self pickupTarget:targetList];
    }
    return nil;
}
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
