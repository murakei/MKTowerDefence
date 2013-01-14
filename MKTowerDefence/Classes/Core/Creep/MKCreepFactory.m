//
//  MKCreepFactory.m
//  MKTowerDefence
//
//  Created by Murakei on 2013/01/14.
//  Copyright (c) 2013年 Murakei. All rights reserved.
//

#import "MKCreepFactory.h"

@implementation MKCreepFactory

/**
 * Factoryを生成する
 * @param course Creepの通るコース
 * @return id インスタンス
 */
- (id)initWithCourse:(MKCourse *)course {
    if (self = [super init]) {
        _course = course;
        numberOfCreepCreated = 0;
    }
    return self;
}
/**
 * Creepを生成する.
 * commandとはCreepのパラメータを１つずつチマチマ設定するのが面倒なので、
 * ある程度まとめてロジック化しようと思うためである.
 * 将来的にはCreep別のロジックもコマンドで指定できるようにしたい.
 */
- (MKCreep *)createWithCommand:(NSString *)command {
    MKCreep *c = [[MKCreep alloc] init];
    
    // command により調整
    [c setCourse:[_course copy]];
    c.speed = 1;
    c.rotateSpeed = 1;
    
    numberOfCreepCreated++;
    return c;
}

@end
