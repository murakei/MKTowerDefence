//
//  MKProjectileRepository.m
//  MKTowerDefence
//
//  Created by Murakei on 2013/01/20.
//  Copyright (c) 2013年 Murakei. All rights reserved.
//

#import "MKProjectileRepository.h"

@implementation MKProjectileRepository

- (id)init {
    if (self = [super init]) {
        _repository = [[NSMutableArray alloc] init];
    }
    return self;
}
/**
 * 全てのProjectileを取得する
 * @return (NSArray *)Projectileのリスト
 */
- (NSArray *)findAll {
    return _repository;
}
/**
 * Projectile を追加する
 * @param projectile 追加するProjectile
 */
- (void)addProjectile:(id<MKProjectileProtocol>)projectile {
    [_repository addObject:projectile];
}

/**
 * Projectile を削除する
 * @param projectile 削除するProjectile
 */
- (void)deleteProjectile:(id<MKProjectileProtocol>)projectile {
    [_repository removeObject:projectile];
}



@end
