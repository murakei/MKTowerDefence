//
//  MKTowerTest.m
//  MKTowerDefence
//
//  Created by Murakei on 2013/01/20.
//  Copyright (c) 2013年 Murakei. All rights reserved.
//

#import "MKTowerTest.h"
#import "MKTower.h"
#import "MKCreepRepository.h"
#import "MKCreepFactory.h"
#import "MKCreep.h"

@implementation MKTowerTest

- (void)testInitTower {
    MKTower *tower = [[MKTower alloc] initWithPoint:[MKPoint createWithX:100 andY:100]];
    STAssertNotNil(tower, @"Towerを生成できること");
    
    STAssertTrue([[tower currentPoint] compareTo:[MKPoint createWithX:100 andY:100]],
                 @"tower は 初期の現在位置(currentPoint)を必ず持つこと");
    STAssertNil([tower targetPoint], @"tower は 目標位置(targetPoint)を持たないこと");
    STAssertEquals([tower towerId], 1, @"tower はIDを持つこと.ただし一意であることはRepositoryに任せる");
    STAssertEquals([tower range], (float) 10, @"tower の射程距離の初期値は10であること");
    STAssertEquals([tower shootCounter], 0, @"tower の弾発射のカウンタの初期値は10であること");
    STAssertEquals([tower shootCounterMax], 10, @"tower の弾発射のカウンタの最大値（発射間隔）の初期値は10であること");
    // tower は action,shootといった動作を実行できること
    [tower action];
    [tower shoot];
}

- (void)testAction {
    MKTower *tower = [[MKTower alloc] initWithPoint:[MKPoint createWithX:90 andY:100]];
    [tower setRange:10];
    [tower action];
    STAssertNil([tower targetPoint], @"tower は 目標位置(targetPoint)を持たないこと");
    STAssertNil([tower shoot], @"攻撃対象が居ない場合はshootしてもnilが返ること");
    MKCreep *creep = [[MKCreep alloc] init];
    [creep setCourse:[MKCourse createSampleCourse]];
    [creep setStartPoint];
    MKCreepRepository *creepRepository = [[MKCreepRepository alloc] init];
    [creepRepository addCreep:creep];
    [tower setCreepRepository:creepRepository];
    STAssertNil([tower targetPoint], @"tower は 目標位置(targetPoint)を持たないこと");
    STAssertNil([tower shoot], @"攻撃対象が居ない場合はshootしてもnilが返ること");

    [tower action];
    STAssertNotNil([tower targetPoint], @"tower は 目標位置(targetPoint)を持たないこと");
    STAssertNotNil([tower shoot], @"攻撃対象が居ない場合はshootしてもnilが返ること");
}

@end
