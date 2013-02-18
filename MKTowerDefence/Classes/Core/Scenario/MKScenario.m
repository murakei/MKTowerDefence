//
//  MKScenario.m
//  MKTowerDefence
//
//  Created by Murakei on 2013/01/26.
//  Copyright (c) 2013年 Murakei. All rights reserved.
//

#import "MKScenario.h"
#import "MKWave.h"

@implementation MKScenario

- (id)init {
    if (self = [super init]) {
        _wave = [[NSMutableArray alloc] init];
        _waveCounter = 0;
        _frameCounter = 0;
        _currentWave = nil;
        scenarioIsOver = NO;
    }
    return self;
}

/**
 * Waveデータを追加する
 * @params wata a wave
 */
- (void)addWave:(MKWave *)wave {
    if (wave == nil) {
        return;
    }
    [_wave addObject:wave];
}
/**
 * Waveデータを取得する
 * @return next wave
 */
- (MKWave *)getNextWave {
    if (_waveCounter >= [_wave count]) {
        return nil;
    }
    _currentWave = [_wave objectAtIndex:_waveCounter];
    _waveCounter ++;
    return _currentWave;
}
/**
 * サンプルScenarioを生成する
 * @return a sample scenario
 */
+ (MKScenario *)createSampleScenario {
    MKScenario *scenario = [[MKScenario alloc] init];
    [scenario addWave:[MKWave createSampleWave]];
    return scenario;
}
/**
 * plistのXML情報からScenarioを生成する
 * @params plist Scenarioデータ
 * @return scenario instance
 */
+ (MKScenario *)createScenarioFromPlist:(NSArray *)plist {
    MKScenario *scenario = [[MKScenario alloc] init];
    for (int i = 0; i < [plist count]; i++) {
        NSArray *waves = [[plist objectAtIndex:i] objectForKey:@"wave"];
        MKWave *wave = [[MKWave alloc] init];
        for (int j = 0; j < [waves count]; j++) {
            NSDictionary *item = [waves objectAtIndex:j];
            [wave addWaveData:
                [MKWaveData createWithCreepType:[item objectForKey:@"creepType"]
                                      waitFrame:[[item objectForKey:@"waitFrame"] intValue]]];
        }
        [scenario addWave:wave];
    }
    return scenario;
}
/**
 * frameをカウントし起こすべきアクションを得る
 * @return アクションの内容
 */
- (NSString *)frameCount {
    // 内部フレームはwave dataに対するカウンタで都度ゼロに戻す
    static int innerFrameCounter = 0;
    // 全てのwave を取得している場合は空文字を返す
    if (scenarioIsOver) {
        return @"";
    }
    // 現在のwaveがnilまたは全wave data取得済みの場合は次のwaveを取得する
    if (_currentWave == nil || [_currentWave isOver]) {
        [self getNextWave];
        
        // 次のwaveもnilの場合は全てのwaveを取得したものとし空文字を返す
        if (_currentWave == nil) {
            scenarioIsOver = YES;
            return @"";
        }

        // 新たに設定したwaveをセットアップする
        [_currentWave getNextWaveData];
    }
    // ここに到達する時点でcurrentWaveは存在する
    // フレームをカウントアップし、内部フレームもカウントアップする
    _frameCounter ++;
    innerFrameCounter ++;

    // for debug.
    NSLog(@"%d[%d]", _frameCounter, innerFrameCounter);
    
    // 現在のwaveのウェイトフレームを内部フレームが越える場合
    if (innerFrameCounter > [_currentWave getWaitFrame]) {
        
        // 内部フレームをゼロにリセットし、出現するCreepTypeを取得する
        // waveに対し次ぎのwave dataを参照するよう指示しておく
        innerFrameCounter = 0;
        NSString *creepType = [_currentWave getCreepType];
        [_currentWave getNextWaveData];
        return creepType;
    }
    return @"";
}

@end
