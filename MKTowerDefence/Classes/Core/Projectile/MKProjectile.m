//
//  MKProjectile.m
//  MKTowerDefence
//
//  Created by Murakei on 2013/01/20.
//  Copyright (c) 2013年 Murakei. All rights reserved.
//

#import "MKProjectile.h"

@implementation MKProjectile

@synthesize tower = _tower;
@synthesize creepRepository = _creepRepository;
@synthesize range = _range;
@synthesize damage = _damage;
@synthesize exploded;

- (id)init {
    if (self = [super init]) {
        [self setCurrentPoint:[MKPoint createWithX:0 andY:0]];
        _damage = 0;
        _range = 0;
        exploded = NO;
    }
    return self;
}
/**
 * 動作を行う.
 * 動作内容は最初にセットした方向にひたすら進む.
 * 途中で敵が射程距離内に入った場合は爆発する.
 * そうでない場合は画面外に出ると消える.
 */
- (void)action {
    if ([self targetPoint] == nil) {
        return;
    }
    [self move];
}
/**
 * 弾が爆発したかチェックする
 */
- (void)checkExploded {
    NSArray *list = [_creepRepository findAll];
    BOOL bomb = NO;
    for (int i = 0; i < [list count]; i++) {
        id<MKCreepProtocol> creep = [list objectAtIndex:i];
        float distance = [[creep currentPoint] calcDistanceTo:[self currentPoint]];
        if (_range >= distance) {
            [creep damage:_damage];
            bomb = YES;
        }
    }
    exploded = bomb;
}
/**
 * @override
 */
- (void)setTargetPoint:(MKPoint *)point {
    [super setTargetPoint:point];
    [self calcAngle];
    [self rotate];
    [self calcMovement];
}

@end
