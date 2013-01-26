//
//  MKWaveTest.m
//  MKTowerDefence
//
//  Created by Murakei on 2013/01/26.
//  Copyright (c) 2013年 Murakei. All rights reserved.
//

#import "MKWaveTest.h"
#import "MKWave.h"

@implementation MKWaveTest

- (void)testCreate {
    MKWave *wave = [[MKWave alloc] init];
    STAssertNotNil(wave, @"インスタンスを生成できること");
    STAssertNil([wave getNextWaveData], @"インスタンス生成直後は空なのでwave dataを返さずnilを返すこと");
}

- (void)testSampleWave {
    MKWave *wave = [MKWave createSampleWave];
    MKWaveData *data1 = [wave getNextWaveData];
    STAssertNotNil(data1, @"最初のwave dataを返すこと");
    STAssertTrue([data1.creepType isEqualToString:@"creepA"], @"creep typeを取得できること");
    STAssertEquals(10, data1.waitFrame, @"wait frameを取得できること");
}

- (void)testAllDataGet {
    MKWave *wave = [MKWave createSampleWave];
    STAssertNotNil([wave getNextWaveData], @"1件目のデータを取得できること");
    STAssertNotNil([wave getNextWaveData], @"2件目のデータを取得できること");
    STAssertNotNil([wave getNextWaveData], @"3件目のデータを取得できること");
    STAssertNil([wave getNextWaveData], @"全てのデータを取得したのでnilを返すこと");
}

- (void)testGetDataFromWave {
    MKWave *wave = [[MKWave alloc] init];
    MKWaveData *data1 = [MKWaveData createWithCreepType:@"aaa" waitFrame:0];
    MKWaveData *data2 = [MKWaveData createWithCreepType:@"bbb" waitFrame:1];
    MKWaveData *data3 = [MKWaveData createWithCreepType:@"ccc" waitFrame:2];
    MKWaveData *data4 = [MKWaveData createWithCreepType:@"ddd" waitFrame:3];
    MKWaveData *data5 = [MKWaveData createWithCreepType:@"eee" waitFrame:4];
    [wave addWaveData:data1];
    [wave addWaveData:data2];
    [wave addWaveData:data3];
    [wave addWaveData:data4];
    [wave addWaveData:data5];
    
    [wave getNextWaveData];
    
    int counter = 0;
    int innerCounter = 0;
    while (![wave isOver]) {
        counter ++;
        innerCounter ++;
        if (innerCounter >= [wave getWaitFrame]) {
            innerCounter = 0;
            [wave getCreepType];
            [wave getNextWaveData];
        }
    }
}

@end
