//
//  MKPoint.h
//  MKTowerDefence
//
//  Created by Murakei on 2013/01/14.
//  Copyright (c) 2013年 Murakei. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * ２次元平面における座標を表すクラス.
 */
@interface MKPoint : NSObject {
    /**
     * 座標を表す
     */
    CGPoint _point;
}
/**
 * 新しいインスタンスを生成する
 */
+ (MKPoint *)createWithX:(float)x andY:(float)y;

@end
