//
//  MKScenario.h
//  MKTowerDefence
//
//  Created by Murakei on 2013/01/26.
//  Copyright (c) 2013年 Murakei. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MKWave;

/**
 * １つのゲームステージの敵出現データ.
 * 複数のWaveのリストで構成される.
 * 
 */
@interface MKScenario : NSObject {
    /**
     * Waveのリスト
     */
    NSMutableArray *_wave;
    /**
     * waveカウンタ
     */
    int _waveCounter;
    /**
     * frameカウンタ
     */
    int _frameCounter;
    /**
     * 現在のwave
     */
    MKWave *_currentWave;
    /**
     * 全ての敵出現が終了したか否か
     */
    BOOL scenarioIsOver;
}

/**
 * Waveデータを追加する
 * @params wata a wave
 */
- (void)addWave:(MKWave *)wave;
/**
 * Waveデータを取得する
 */
- (MKWave *)getNextWave;
/**
 * サンプルScenarioを生成する
 */
+ (MKScenario *)createSampleScenario;
/**
 * frameをカウントし起こすべきアクションを得ます
 * @return アクションの内容
 */
- (NSString *)frameCount;

@end
