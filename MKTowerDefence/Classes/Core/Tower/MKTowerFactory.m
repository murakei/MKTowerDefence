//
//  MKTowerFactory.m
//  MKTowerDefence
//
//  Created by Murakei on 2013/01/20.
//  Copyright (c) 2013年 Murakei. All rights reserved.
//

#import "MKTowerFactory.h"

@implementation MKTowerFactory

/**
 * Factoryを生成する
 * @param creepRepository CreepRepository
 * @return id インスタンス
 */
- (id)initWithCourse:(MKCreepRepository *)creepRepository {
    if (self = [super init]) {
        _creepRepository = creepRepository;
        numberOfTowerCreated = 0;
    }
    return self;
}
/**
 * Towerを生成する.
 * commandとはTowerのパラメータを１つずつチマチマ設定するのが面倒なので、
 * ある程度まとめてロジック化しようと思うためである.
 * 将来的にはTower別のロジックもコマンドで指定できるようにしたい.
 */
- (MKTower *)createWithCommand:(NSString *)command {
    MKTower *tower = [[[MKTower alloc] init] autorelease];
    
    numberOfTowerCreated++;
    return tower;
}

@end
