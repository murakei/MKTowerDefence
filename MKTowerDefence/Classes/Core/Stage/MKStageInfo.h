//
//  MKStageInfo.h
//  MKTowerDefence
//
//  Created by Murakei on 2013/02/04.
//  Copyright (c) 2013年 Murakei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MKStageInfo : NSObject {
    NSDictionary *plist;
}

/**
 * ステージ情報をplistファイル名を指定して初期化する
 * @param resource plistファイル名(拡張子除く)
 * @return self
 */
- (id)initWithPlist:(NSString *)resource;
/**
 * ステージ番号を取得する
 * @return ステージ番号
 */
- (int)number;
/**
 * ステージタイトルを取得する
 * @return ステージタイトル
 */
- (NSString *)title;
/**
 * 開始時のライフ数を取得する
 * @return ライフ数
 */
- (int)lives;
/**
 * 開始時の所持金を取得する
 * @return 所持金
 */
- (int)cash;
/**
 * 使用可能なtowerのリストを返す
 * @return towerのリスト
 */
- (NSArray *)towers;
/**
 * シナリオ情報を返す
 * @return NSArray scenario情報
 */
- (NSArray *)scenario;
/**
 * コース情報を返す
 * @return NSArray course情報
 */
- (NSArray *)course;

@end
