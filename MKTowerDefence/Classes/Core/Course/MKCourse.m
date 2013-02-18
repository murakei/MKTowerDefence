//
//  MKCourse.m
//  MKTowerDefence
//
//  Created by Murakei on 2013/01/14.
//  Copyright (c) 2013年 Murakei. All rights reserved.
//

#import "MKCourse.h"

@implementation MKCourse

- (id)init {
    if (self = [super init]) {
        pointIndex = 0;
        _pointList = [[NSMutableArray alloc] init];
    }
    return self;
}
- (id)copyWithZone:(NSZone *)zone {
    MKCourse *c = [[MKCourse allocWithZone:zone] init];
    if (c) {
        c->_pointList = [_pointList copyWithZone:zone];
        c->pointIndex = pointIndex;
    }
    return c;
}
/**
 * サンプルのコースを生成します
 */
+ (MKCourse *)createSampleCourse {
    MKCourse *c = [[MKCourse alloc] init];
    [c addPoint:[MKPoint createWithX:100 andY:100]];
    [c addPoint:[MKPoint createWithX:100 andY:200]];
    [c addPoint:[MKPoint createWithX:200 andY:200]];
    return c;
}
/**
 * plistのXML情報からCourseを生成する
 * @params plist Courseデータ
 * @return course instance
 */
+ (MKCourse *)createCourseFromPlist:(NSArray *)plist {
    MKCourse *course = [[MKCourse alloc] init];
    for (int i = 0; i < [plist count]; i++) {
        NSDictionary *item = [plist objectAtIndex:i];
        float x = [[item objectForKey:@"x"] floatValue];
        float y = [[item objectForKey:@"y"] floatValue];
        [course addPoint:[MKPoint createWithX:x andY:y]];
    }
    return course;
}
/**
 * コースに目標地点を追加する.
 * コースはステージごとに決まるのでコース初期化時にのみ利用する想定.
 */
- (void)addPoint:(MKPoint *)point {
    [_pointList addObject:point];
}
/**
 * 次の地点を返す.
 * (Creepには次のコースを選択する余地がない)
 */
- (MKPoint *)nextPoint {
    // コースが空の場合、nilを返す
    if (_pointList == nil) {
        return nil;
    }
    // コースの全地点を返している場合、nilを返す
    if (pointIndex >= [_pointList count]) {
        return nil;
    }
    MKPoint *p = [[_pointList objectAtIndex:pointIndex] copy];
    pointIndex++;
    return p;
}

@end
