//
//  MKCreep.m
//  MKTowerDefence
//
//  Created by Murakei on 2013/01/14.
//  Copyright (c) 2013年 Murakei. All rights reserved.
//

#import "MKCreep.h"

@implementation MKCreep

@synthesize creepId;

- (id)init {
    if (self = [super init]) {
        reachFinalDestination = NO;
    }
    return self;
}
/**
 * Creepが移動するコースを設定する.
 * 原則、Creep生成直後に設定し、変更することはない.
 */
- (void)setCourse:(MKCourse *)course {
    _course = course;
}
/**
 * Creepを初期位置に設定する.
 * Creepを生成してすぐ表示するのは後で変更したくなるかもしれないので、
 * 生成と初期位置の設定を別メソッドにする.
 */
- (void)setStartPoint {
    if (_course == nil) {
        return;
    }
    [self setCurrentPoint:[_course nextPoint]];
    [self setTargetPoint:[_course nextPoint]];
    [self calcAngle];
    [self rotate];
    [self calcMovement];
}

/**
 * 動作を行う.
 * 動作内容は与えられたコースなどによる.
 * ルートの新たな目標地点の設定などは本メソッド内で自動的に行う.
 */
- (void)action {
    // コースが未設定の場合、移動先が不明なので動作しない
    if (_course == nil) {
        return;
    }
    // ゴールに到達している場合は、動作しない
    if (reachFinalDestination) {
        return;
    }
    // 現在位置が未設定の場合は、コースの最初の地点を設定する
    if ([self currentPoint] == nil) {
        [self setCurrentPoint:[_course nextPoint]];
        
    }
    // 目標地点が未設定または現在位置が目標地点に到達している場合は
    // 新たな目標地点を設定する
    if ([self targetPoint] == nil
        || [[self currentPoint] compareTo:[self targetPoint]]) {
        [self setTargetPoint:[_course nextPoint]];
        [self calcAngle];
        [self rotate];
        [self calcMovement];
    }
    // 移動を行う.
    [self move];
}

@end
