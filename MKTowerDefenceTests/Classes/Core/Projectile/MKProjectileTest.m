//
//  MKProjectileTest.m
//  MKTowerDefence
//
//  Created by Murakei on 2013/01/20.
//  Copyright (c) 2013年 Murakei. All rights reserved.
//

#import "MKProjectileTest.h"
#import "MKProjectile.h"
#import "MKCreepRepository.h"
#import "MKCreepFactory.h"
#import "MKCreep.h"

@implementation MKProjectileTest

- (void)testInitProjectile {
    MKProjectile *projectile = [[MKProjectile alloc] init];
    STAssertNotNil(projectile, @"projectileを生成できること");
    STAssertNotNil([projectile currentPoint], @"projectileは初期の現在位置を持つこと");
    STAssertNil([projectile targetPoint], @"projectileは初期の目標位置を持たないこと");

    STAssertFalse([projectile exploded], @"projectileは生成直後はまだ爆発していないこと");
}

- (void)testAction {
    MKProjectile *projectile = [[MKProjectile alloc] init];
    [projectile setCurrentPoint:[MKPoint createWithX:90 andY:100]];
    [projectile setTargetPoint:[MKPoint createWithX:200 andY:100]];
    [projectile setSpeed:10];
    [projectile setRange:8];
    
    MKCreep *creep = [[MKCreep alloc] init];
    [creep setCourse:[MKCourse createSampleCourse]];
    [creep setStartPoint];
    MKCreepRepository *creepRepository = [[MKCreepRepository alloc] init];
    [creepRepository addCreep:creep];
    [projectile setCreepRepository:creepRepository];

    [projectile checkExploded];
    STAssertFalse([projectile exploded], @"projectileは生成直後はまだ爆発していないこと");

    [projectile action];
    [projectile checkExploded];
    STAssertTrue([projectile exploded], @"projectileは生成直後はまだ爆発していないこと");

}

@end
