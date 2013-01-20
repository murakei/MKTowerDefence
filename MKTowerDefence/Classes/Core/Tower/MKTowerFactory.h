//
//  MKTowerFactory.h
//  MKTowerDefence
//
//  Created by Murakei on 2013/01/20.
//  Copyright (c) 2013年 Murakei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MKTower.h"
#import "MKCreepRepository.h"

@interface MKTowerFactory : NSObject {
    /**
     * Towerが所有するCreepリポジトリへのリンク
     */
    MKCreepRepository *_creepRepository;
    /**
     * Towerを生成した数.
     * TowerのIdに利用する.
     */
    int numberOfTowerCreated;
}
/**
 * Factoryを生成する
 * @param creepRepository CreepRepository
 * @return id インスタンス
 */
- (id)initWithCourse:(MKCreepRepository *)creepRepository;
/**
 * Towerを生成する.
 * commandとはTowerのパラメータを１つずつチマチマ設定するのが面倒なので、
 * ある程度まとめてロジック化しようと思うためである.
 * 将来的にはTower別のロジックもコマンドで指定できるようにしたい.
 */
- (MKTower *)createWithCommand:(NSString *)command;


@end
