//
//  MKWave.m
//  MKTowerDefence
//
//  Created by Murakei on 2013/01/26.
//  Copyright (c) 2013年 Murakei. All rights reserved.
//

#import "MKWave.h"

@implementation MKWave

- (id)init {
    if (self = [super init]) {
        _waveData = [[NSMutableArray alloc] init];
        _counter = 0;
        _currentWaveData = nil;
    }
    return self;
}
/**
 * 敵の出現データを追加する
 * @params data WaveData
 */
- (void)addWaveData:(MKWaveData *)data {
    if (data == nil) {
        return;
    }
    [_waveData addObject:data];
}
/**
 * 敵の出現データを取得する
 * @return WaveData
 */
- (MKWaveData *)getNextWaveData {
    if (_counter >= [_waveData count]) {
        _currentWaveData = nil;
        return nil;
    }
    _currentWaveData = [_waveData objectAtIndex:_counter];
    _counter ++;
    return _currentWaveData;
}
/**
 * サンプルWaveを生成する
 * @return インスタンス
 */
+ (MKWave *)createSampleWave {
    MKWave *wave = [[MKWave alloc] init];
    [wave addWaveData:[MKWaveData createWithCreepType:@"creepA" waitFrame:10]];
    [wave addWaveData:[MKWaveData createWithCreepType:@"creepA" waitFrame:10]];
    [wave addWaveData:[MKWaveData createWithCreepType:@"creepA" waitFrame:10]];
    return wave;
}
/**
 * 現在のウェイトフレーム数を返す
 * @return current wait frame
 */
- (int)getWaitFrame {
    if (_currentWaveData != nil) {
        return _currentWaveData.waitFrame;
    }
    return 0;
}
/**
 * 現在の敵の情報を返す
 * @return 敵の情報
 */
- (NSString *)getCreepType {
    if (_currentWaveData != nil) {
        return _currentWaveData.creepType;
    }
    return @"";
}
/**
 * 全ての出現データを取得し終わったか返す
 * @return YES:終わっている NO:まだ終わっていない
 */
- (BOOL)isOver {
    if (_currentWaveData != nil) {
        return _counter > [_waveData count];
    }
    return YES;
}

@end

@implementation MKWaveData

/**
 * インスタンスを生成する
 * @params creepType 敵の情報
 * @params waitFrame 敵出現のウェイトフレーム数
 * @return (MKWaveData)一体の敵の出現に関する情報
 */
+ (MKWaveData *)createWithCreepType:(NSString *)creepType waitFrame:(int)waitFrame {
    MKWaveData *data = [[MKWaveData alloc] init];
    data.creepType = creepType;
    data.waitFrame = waitFrame;
    return data;
}

@end
