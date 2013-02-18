//
//  MKStageInfo.m
//  MKTowerDefence
//
//  Created by Murakei on 2013/02/04.
//  Copyright (c) 2013年 Murakei. All rights reserved.
//

#import "MKStageInfo.h"

@implementation MKStageInfo

/**
 * ステージ情報をplistファイル名を指定して初期化する
 * @param resource plistファイル名(拡張子除く)
 * @return self
 */
- (id)initWithPlist:(NSString *)resource {
    if (self = [super init]) {
        NSString *path = [[NSBundle mainBundle] pathForResource:resource ofType:@"plist"];
        plist = [NSDictionary dictionaryWithContentsOfFile:path];
    }
    return self;
}
/**
 * ステージ番号を取得する
 * @return ステージ番号
 */
- (int)number {
    NSNumber *n = [plist objectForKey:@"number"];
    return (n ? [n intValue] : -1);
}
/**
 * ステージタイトルを取得する
 * @return ステージタイトル
 */
- (NSString *)title {
    return [plist objectForKey:@"title"];
}
/**
 * 開始時のライフ数を取得する
 * @return ライフ数
 */
- (int)lives {
    NSNumber *n = [plist objectForKey:@"lives"];
    return (n ? [n intValue] : -1);
}
/**
 * 開始時の所持金を取得する
 * @return 所持金
 */
- (int)cash {
    NSNumber *n = [plist objectForKey:@"cash"];
    return (n ? [n intValue] : -1);
}
/**
 * 使用可能なtowerのリストを返す
 * @return towerのリスト
 */
- (NSArray *)towers {
    NSArray *towers = [NSArray arrayWithArray:[plist objectForKey:@"towers"]];
    return (towers ? towers : nil);
}
/**
 * シナリオ情報を返す
 * @return NSArray scenario情報
 */
- (NSArray *)scenario {
    NSArray *scenario = [NSArray arrayWithArray:[plist objectForKey:@"scenario"]];
    return (scenario ? scenario : nil);
}
/**
 * コース情報を返す
 * @return NSArray course情報
 */
- (NSArray *)course {
    NSArray *course = [NSArray arrayWithArray:[plist objectForKey:@"course"]];
    return (course ? course : nil);
}

@end
