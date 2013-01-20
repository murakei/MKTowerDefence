//
//  MKCreepRepository.m
//  MKTowerDefence
//
//  Created by Murakei on 2013/01/14.
//  Copyright (c) 2013年 Murakei. All rights reserved.
//

#import "MKCreepRepository.h"

@implementation MKCreepRepository

- (id)init {
    if (self = [super init]) {
        _repository = [[NSMutableArray alloc] init];
    }
    return self;
}
/**
 * 全てのCreepを取得する
 * @return (NSArray *)Creepのリスト
 */
- (NSArray *)findAll {
    return _repository;
}
/**
 * Creep を追加する
 * @param creep 追加するcreep
 */
- (void)addCreep:(id<MKCreepProtocol>)creep {
    [_repository addObject:creep];
}
/**
 * Creep を削除する
 * @param creep 削除するcreep
 */
- (void)deleteCreep:(id<MKCreepProtocol>)creep {
    [_repository removeObject:creep];
}

@end
