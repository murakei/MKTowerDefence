//
//  MKScenarioTest.m
//  MKTowerDefence
//
//  Created by Murakei on 2013/01/26.
//  Copyright (c) 2013年 Murakei. All rights reserved.
//

#import "MKScenarioTest.h"
#import "MKScenario.h"
#import "MKWave.h"

@implementation MKScenarioTest

- (void)testCreate {
    MKScenario *scenario = [[MKScenario alloc] init];
    STAssertNotNil(scenario, @"インスタンスを生成できること");
    STAssertNil([scenario getNextWave], @"インスタンス生成直後は空なのでwaveを返さずnilを返すこと");
}

- (void)testSampleScenario {
    MKScenario *scenario = [MKScenario createSampleScenario];
    MKWave *wave1 = [scenario getNextWave];
    STAssertNotNil(wave1, @"最初のwave dataを返すこと");

    MKWaveData *data1 = [wave1 getNextWaveData];
    STAssertNotNil(data1, @"最初のwave dataを返すこと");
    STAssertTrue([data1.creepType isEqualToString:@"creepA"], @"creep typeを取得できること");
    STAssertEquals(10, data1.waitFrame, @"wait frameを取得できること");
}

- (void)testAllDataGet {
    MKScenario *scenario = [MKScenario createSampleScenario];
    STAssertNotNil([scenario getNextWave], @"1件目のデータを取得できること");
    STAssertNil([scenario getNextWave], @"全てのデータを取得したのでnilを返すこと");
}

- (void)testFrameCount {
    MKScenario *scenario = [[MKScenario alloc] init];
    MKWave *wave1 = [[MKWave alloc] init];
    [wave1 addWaveData:[MKWaveData createWithCreepType:@"aaa" waitFrame:0]];
    [wave1 addWaveData:[MKWaveData createWithCreepType:@"bbb" waitFrame:1]];
    [wave1 addWaveData:[MKWaveData createWithCreepType:@"ccc" waitFrame:2]];
    MKWave *wave2 = [[MKWave alloc] init];
    [wave2 addWaveData:[MKWaveData createWithCreepType:@"ddd" waitFrame:0]];
    [wave2 addWaveData:[MKWaveData createWithCreepType:@"eee" waitFrame:1]];
    [scenario addWave:wave1];
    [scenario addWave:wave2];
    
    STAssertTrue([[scenario frameCount] isEqualToString:@"aaa"], @"frame 1");
    STAssertTrue([[scenario frameCount] isEqualToString:@""], @"frame 2");
    STAssertTrue([[scenario frameCount] isEqualToString:@"bbb"], @"frame 3");
    STAssertTrue([[scenario frameCount] isEqualToString:@""], @"frame 4");
    STAssertTrue([[scenario frameCount] isEqualToString:@""], @"frame 5");
    STAssertTrue([[scenario frameCount] isEqualToString:@"ccc"], @"frame 6");
    STAssertTrue([[scenario frameCount] isEqualToString:@"ddd"], @"frame 7");
    STAssertTrue([[scenario frameCount] isEqualToString:@""], @"frame 8");
    STAssertTrue([[scenario frameCount] isEqualToString:@"eee"], @"frame 9");
    
    
}

@end
