//
//  MKCreepRepository.h
//  MKTowerDefence
//
//  Created by Muradome on 2013/01/14.
//  Copyright (c) 2013年 Murakei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MKCreepProtocol.h"

@interface MKCreepRepository : NSObject {
    /**
     * Creep を格納するリスト
     */
    NSMutableArray *_repository;
}
/**
 * 全てのCreepを取得する
 * @return (NSArray *)Creepのリスト
 */
- (NSArray *)findAll;
/**
 * Creep を追加する
 * @param creep 追加するcreep
 */
- (void)addCreep:(id<MKCreepProtocol>)creep;
/**
 * Creep を削除する
 * @param creep 削除するcreep
 */
- (void)deleteCreep:(id<MKCreepProtocol>)creep;

@end
