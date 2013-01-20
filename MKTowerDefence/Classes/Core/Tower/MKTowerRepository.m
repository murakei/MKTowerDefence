//
//  MKTowerRepository.m
//  MKTowerDefence
//
//  Created by Murakei on 2013/01/20.
//  Copyright (c) 2013年 Murakei. All rights reserved.
//

#import "MKTowerRepository.h"

@implementation MKTowerRepository

- (id)init {
    if (self = [super init]) {
        _repository = [[NSMutableArray alloc] init];
    }
    return self;
}
/**
 * 全てのTowerを取得する
 * @return (NSArray *)Towerのリスト
 */
- (NSArray *)findAll {
    return _repository;
}

/**
 * Tower を追加する
 * @param tower 追加するTower
 */
- (void)addTower:(id<MKTowerProtocol>)tower {
    [_repository addObject:tower];
}

/**
 * Tower を削除する
 * @param tower 削除するTower
 */
- (void)deleteTower:(id<MKTowerProtocol>)tower {
    [_repository removeObject:tower];
}


@end
