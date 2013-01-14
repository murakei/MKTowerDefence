//
//  MKCreepFactory.h
//  MKTowerDefence
//
//  Created by Murakei on 2013/01/14.
//  Copyright (c) 2013年 Murakei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MKCourse.h"
#import "MKCreep.h"

/**
 * CreepのFactory.
 */
@interface MKCreepFactory : NSObject {
    /**
     * Creepの通るコース
     */
    MKCourse *_course;
    /**
     * Creepを生成した数.
     * CreepのIdに利用する.
     */
    int numberOfCreepCreated;
}
/**
 * Factoryを生成する
 * @param course Creepの通るコース
 * @return id インスタンス
 */
- (id)initWithCourse:(MKCourse *)course;
/**
 * Creepを生成する.
 * commandとはCreepのパラメータを１つずつチマチマ設定するのが面倒なので、
 * ある程度まとめてロジック化しようと思うためである.
 * 将来的にはCreep別のロジックもコマンドで指定できるようにしたい.
 */
- (MKCreep *)createWithCommand:(NSString *)command;

@end
