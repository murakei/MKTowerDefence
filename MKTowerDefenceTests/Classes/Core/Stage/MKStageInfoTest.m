//
//  MKStageInfoTest.m
//  MKTowerDefence
//
//  Created by Murakei on 2013/02/04.
//  Copyright (c) 2013年 Murakei. All rights reserved.
//

#import "MKStageInfoTest.h"
#import "MKScenario.h"
#import "MKCourse.h"

@implementation MKStageInfoTest

- (void)setUp {
    [super setUp];
    stage = [[MKStageInfo alloc] initWithPlist:@"stageForTest"];
    error = [[MKStageInfo alloc] initWithPlist:@""];
}

- (void)testGetStageNumber {
    STAssertEquals(1, [stage number], @"ステージ番号を取得できること");
    STAssertEquals(-1, [error number], @"ステージ番号を取得できないときは-1を返すこと");
}

- (void)testGetStageTitle {
    STAssertTrue([@"Begginers Defence" isEqualToString:[stage title]], @"ステージタイトルを取得できること");
    STAssertNil([error title], @"ステージタイトルを取得できないときはnilを返すこと");
}

- (void)testGetLives {
    STAssertEquals(15, [stage lives], @"開始時のライフ数を取得できること");
    STAssertEquals(-1, [error lives], @"開始時のライフ数を取得できないときは-1を返すこと");
}

- (void)testGetCash {
    STAssertEquals(30, [stage cash], @"開始時の所持金を取得できること");
    STAssertEquals(-1, [error cash], @"開始時の所持金を取得できないときは-1を返すこと");
}

- (void)testGetTowers {
    NSArray *towers = [stage towers];
    STAssertEquals((uint) 1, [towers count], @"towerの数を取得できること");
    NSDictionary *firstTower = [towers objectAtIndex:0];
    STAssertTrue([@"Blaster Tower" isEqualToString:[firstTower objectForKey:@"name"]], @"Towerの名前を取得できること");
    STAssertTrue([@"BlasterTowerSelect" isEqualToString:[firstTower objectForKey:@"picture"]], @"Tower選択用の画像名を取得できること");

    NSArray *towerdata = [firstTower objectForKey:@"towerdata"];
    STAssertEquals((uint) 2, [towerdata count], @"レベル別のタワーデータが２件あること");
    
    NSDictionary *level1 = [towerdata objectAtIndex:0];
    STAssertEquals(1, [[level1 objectForKey:@"level"] intValue], @"levelが正しいこと");
    STAssertTrue([@"Blaster Cannon" isEqualToString:[level1 objectForKey:@"name"]], @"nameが正しいこと");
    STAssertTrue([@"BlasterTower1" isEqualToString:[level1 objectForKey:@"picture"]], @"pictureが正しいこと");
    STAssertEquals(10, [[level1 objectForKey:@"upgrade"] intValue], @"upgradeが正しいこと");
    STAssertEquals(7, [[level1 objectForKey:@"sell"] intValue], @"sellが正しいこと");
    STAssertEquals(10, [[level1 objectForKey:@"range"] intValue], @"rangeが正しいこと");
    STAssertEquals(20, [[level1 objectForKey:@"shotspeed"] intValue], @"shotspeedが正しいこと");
    STAssertEquals(1, [[level1 objectForKey:@"damage"] intValue], @"damageが正しいこと");

    NSDictionary *level2 = [towerdata objectAtIndex:1];
    STAssertEquals(2, [[level2 objectForKey:@"level"] intValue], @"levelが正しいこと");
    STAssertTrue([@"Blaster Cannon 2" isEqualToString:[level2 objectForKey:@"name"]], @"nameが正しいこと");
    STAssertTrue([@"BlasterTower2" isEqualToString:[level2 objectForKey:@"picture"]], @"pictureが正しいこと");
    STAssertEquals(15, [[level2 objectForKey:@"upgrade"] intValue], @"upgradeが正しいこと");
    STAssertEquals(10, [[level2 objectForKey:@"sell"] intValue], @"sellが正しいこと");
    STAssertEquals(10, [[level2 objectForKey:@"range"] intValue], @"rangeが正しいこと");
    STAssertEquals(20, [[level2 objectForKey:@"shotspeed"] intValue], @"shotspeedが正しいこと");
    STAssertEquals(2, [[level2 objectForKey:@"damage"] intValue], @"damageが正しいこと");
}

/**
 * plistのscenario以下の情報からScenarioクラスのインスタンスを生成できること
 * wave数などの情報をまだScenario側で扱えるようにしていないのでいずれ修正すること
 */
- (void)testGetScenarioAndCreateScenarioInstance {
    NSArray *scenarioInfo = [stage scenario];
    MKScenario *scenario = [MKScenario createScenarioFromPlist:scenarioInfo];
    for (int i = 0; i < 10; i++) {
        STAssertTrue([[scenario frameCount] isEqualToString:@""], @"none");
    }
    STAssertTrue([[scenario frameCount] isEqualToString:@"creepA"], @"wave 1 - 1");
    for (int i = 0; i < 10; i++) {
        STAssertTrue([[scenario frameCount] isEqualToString:@""], @"none");
    }
    STAssertTrue([[scenario frameCount] isEqualToString:@"creepA"], @"wave 1 - 2");
    for (int i = 0; i < 10; i++) {
        STAssertTrue([[scenario frameCount] isEqualToString:@""], @"none");
    }
    STAssertTrue([[scenario frameCount] isEqualToString:@"creepA"], @"wave 1 - 3");
}

/**
 * plistのcourse以下の情報からCourseクラスのインスタンスを生成できること
 */
- (void)testGetCourseAndCreateCourseInstance {
    NSArray *courseInfo = [stage course];
    MKCourse *course = [MKCourse createCourseFromPlist:courseInfo];
    STAssertTrue([[course nextPoint] compareTo:[MKPoint createWithX:0 andY:160]], @"目標地点を取得できること(1)");
    STAssertTrue([[course nextPoint] compareTo:[MKPoint createWithX:280 andY:160]], @"目標地点を取得できること(2)");
    STAssertTrue([[course nextPoint] compareTo:[MKPoint createWithX:525 andY:335]], @"目標地点を取得できること(3)");
    STAssertTrue([[course nextPoint] compareTo:[MKPoint createWithX:525 andY:530]], @"目標地点を取得できること(4)");
    STAssertTrue([[course nextPoint] compareTo:[MKPoint createWithX:280 andY:725]], @"目標地点を取得できること(5)");
    STAssertTrue([[course nextPoint] compareTo:[MKPoint createWithX:80 andY:555]], @"目標地点を取得できること(6)");
    STAssertTrue([[course nextPoint] compareTo:[MKPoint createWithX:155 andY:390]], @"目標地点を取得できること(7)");
    STAssertNil([course nextPoint], @"全ての地点を取得した後はNilを返すこと");
}

@end
