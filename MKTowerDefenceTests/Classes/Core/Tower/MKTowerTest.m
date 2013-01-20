//
//  MKTowerTest.m
//  MKTowerDefence
//
//  Created by Muradome on 2013/01/20.
//  Copyright (c) 2013年 Murakei. All rights reserved.
//

#import "MKTowerTest.h"
#import "MKTower.h"
#import "MKCreepRepository.h"
#import "MKCreepFactory.h"

@implementation MKTowerTest

- (void)testInitTower {
    MKTower *tower = [[MKTower alloc] init];
    STAssertNotNil(tower, @"Towerを生成できること");
    
    // tower は 初期位置(currentPoint)を必ず持つこと
    STAssertNotNil([tower currentPoint], @"tower は 初期の現在位置(currentPoint)を必ず持つこと");
    // tower は 目標位置(targetPoint)を持たないこと
    STAssertNil([tower targetPoint], @"tower は 目標位置(targetPoint)を持たないこと");
    // tower は 一意に識別できるIDを持つこと
    STAssertTrue([tower towerId] > 0, @"tower は 一意に識別できるIDを持つこと");
    // tower は action,shootといった動作を実行できること
    [tower action];
    [tower shoot];
}

- (void)testAction {
    MKTower *tower = [[MKTower alloc] init];
    [tower setCurrentPoint:[MKPoint createWithX:90 andY:100]];
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
