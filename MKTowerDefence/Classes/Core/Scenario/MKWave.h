//
//  MKWave.h
//  MKTowerDefence
//
//  Created by Murakei on 2013/01/26.
//  Copyright (c) 2013年 Murakei. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MKWaveData;

/**
 * 敵の出現に関する情報.
 * どの敵がどのタイミングで出現するかという情報だけで取りあえず作る.
 */
@interface MKWave : NSObject {
    /**
     * 敵の出現データを格納するリスト
     */
    NSMutableArray *_waveData;
    /**
     * リストのインデックス
     */
    int _counter;
    /**
     * 現在指しているwave data
     */
    MKWaveData *_currentWaveData;
}

/**
 * 敵の出現データを追加する
 * @params data WaveData
 */
- (void)addWaveData:(MKWaveData *)data;
/**
 * 敵の出現データを取得する
 */
- (MKWaveData *)getNextWaveData;
/**
 * サンプルWaveを生成する
 */
+ (MKWave *)createSampleWave;
/**
 * 現在のウェイトフレーム数を返す
 * @return current wait frame
 */
- (int)getWaitFrame;
/**
 * 現在の敵の情報を返す
 * @return 敵の情報
 */
- (NSString *)getCreepType;
/**
 * 全ての出現データを取得し終わったか返す
 * @return YES:終わっている NO:まだ終わっていない
 */
- (BOOL)isOver;

@end

/**
 * 一体の敵の出現に関する情報.
 */
@interface MKWaveData : NSObject {
    /**
     *　出現する敵の情報を表すテキスト
     */
    NSString *_creepType;
    /**
     * この敵が出現するまでに待つフレーム数
     */
    int _waitFrame;
}

@property(nonatomic, assign) NSString *creepType;
@property(nonatomic, assign) int waitFrame;

/**
 * インスタンスを生成する
 * @params creepType 敵の情報
 * @params waitFrame 敵出現のウェイトフレーム数
 * @return (MKWaveData)一体の敵の出現に関する情報
 */
+ (MKWaveData *)createWithCreepType:(NSString *)creepType waitFrame:(int)waitFrame;

@end