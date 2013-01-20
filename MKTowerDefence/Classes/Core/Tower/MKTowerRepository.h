//
//  MKTowerRepository.h
//  MKTowerDefence
//
//  Created by Murakei on 2013/01/20.
//  Copyright (c) 2013年 Murakei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MKTowerProtocol.h"

@interface MKTowerRepository : NSObject {
    /**
     * Towerを格納するリスト
     */
    NSMutableArray *_repository;
}
/**
 * 全てのTowerを取得する
 * @return (NSArray *)Towerのリスト
 */
- (NSArray *)findAll;
/**
 * Tower を追加する
 * @param tower 追加するTower
 */
- (void)addTower:(id<MKTowerProtocol>)tower;
/**
 * Tower を削除する
 * @param tower 削除するTower
 */
- (void)deleteTower:(id<MKTowerProtocol>)tower;

@end
