//
//  MKCreepProtocol.h
//  MKTowerDefence
//
//  Created by Muradome on 2013/01/14.
//  Copyright (c) 2013年 Murakei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MKPoint.h"

@protocol MKCreepProtocol <NSObject>

/**
 * 現在位置を返します
 */
- (MKPoint *)currentPoint;
/**
* Creepのid(数値)を返します
*/
- (int)creepId;

@end
