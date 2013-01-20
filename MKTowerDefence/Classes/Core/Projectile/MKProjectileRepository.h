//
//  MKProjectileRepository.h
//  MKTowerDefence
//
//  Created by Muradome on 2013/01/20.
//  Copyright (c) 2013年 Murakei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MKProjectileProtocol.h"

@interface MKProjectileRepository : NSObject {
    /**
     * Projectileを格納するリスト
     */
    NSMutableArray *_repository;
}
/**
 * 全てのProjectileを取得する
 * @return (NSArray *)Projectileのリスト
 */
- (NSArray *)findAll;
/**
 * Projectile を追加する
 * @param projectile 追加するProjectile
 */
- (void)addProjectile:(id<MKProjectileProtocol>)projectile;
/**
 * Projectile を削除する
 * @param projectile 削除するProjectile
 */
- (void)deleteProjectile:(id<MKProjectileProtocol>)projectile;

@end
