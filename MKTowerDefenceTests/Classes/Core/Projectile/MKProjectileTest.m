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
    MKProjectile *projectile = [[MKProjectile alloc] initWithPoint:[MKPoint createWithX:0 andY:0]];
    STAssertNotNil(projectile, @"projectileを生成できること");
    STAssertTrue([[projectile currentPoint] compareTo:[MKPoint createWithX:0 andY:0]], @"projectileは初期の現在位置(0,0)を持つこと");
    STAssertNil([projectile targetPoint], @"projectileは初期の目標位置を持たないこと");

    STAssertFalse([projectile exploded], @"projectileは生成直後はまだ爆発していないこと");
    STAssertEquals(1, [projectile damage], @"projectileは初期ののダメージ値は1であること");
    STAssertEquals((float) 1, [projectile range], @"projectileは初期の射程距離は1であること");
}

- (void)testAction {
    MKProjectile *projectile = [[MKProjectile alloc] initWithPoint:[MKPoint createWithX:90 andY:100]];
    [projectile setTargetPoint:[MKPoint createWithX:200 andY:100]];
    [projectile setSpeed:10];
    [projectile setRange:8];
    
    MKCreepRepository *creepRepository = [self sampleCreepRepository];
    [projectile setCreepRepository:creepRepository];
    
    // projectile (90, 100) -> creep(100, 100)
    [projectile checkExploded];
    STAssertFalse([projectile exploded], @"projectileは生成直後はまだ爆発していないこと");

    // projectile (100, 100) -> creep(100, 100)
    [projectile action];
    [projectile checkExploded];
    STAssertTrue([projectile exploded], @"projectileは移動し、爆発すること");
    
    // projectile (100, 100)のまま
    [projectile action];
    STAssertTrue([[projectile currentPoint] compareTo:[MKPoint createWithX:100 andY:100]], @"爆発後は移動しないこと");
}

- (MKCourse *)sampleCourse {
    MKCourse *c = [[MKCourse alloc] init];
    [c addPoint:[MKPoint createWithX:100 andY:100]];
    return c;
}

- (MKCreepRepository *)sampleCreepRepository {
    MKCreep *creep = [[MKCreep alloc] init];
    [creep setCourse:[self sampleCourse]];
    [creep setStartPoint];
    MKCreepRepository *creepRepository = [[MKCreepRepository alloc] init];
    [creepRepository addCreep:creep];
    return creepRepository;
}

@end
