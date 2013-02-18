//
//  MKCourse.h
//  MKTowerDefence
//
//  Created by Murakei on 2013/01/14.
//  Copyright (c) 2013年 Murakei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MKPoint.h"

/**
 * ゲームステージでCreepが通るコースを表す.
 * とりあえず複雑なコースではなく、スタートからゴールまで１通りのルートしかないコースを表す.
 */
@interface MKCourse : NSObject <NSCopying> {
    /**
     * コースを構成する地点の集合.
     * コースは直線から構成されている前提.
     */
    NSMutableArray *_pointList;
    /**
     *
     */
    int pointIndex;
}
/**
 * サンプルのコースを生成する.
 */
+ (MKCourse *)createSampleCourse;
/**
 * plistのXML情報からCourseを生成する
 * @params plist Courseデータ
 * @return course instance
 */
+ (MKCourse *)createCourseFromPlist:(NSArray *)plist;
/**
 * コースに目標地点を追加する.
 * コースはステージごとに決まるのでコース初期化時にのみ利用する想定.
 */
- (void)addPoint:(MKPoint *)point;
/**
 * 次の地点を返す.
 * (Creepには次のコースを選択する余地がない)
 */
- (MKPoint *)nextPoint;

@end
