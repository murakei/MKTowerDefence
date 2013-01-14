//
//  MKMoveObjectTest.m
//  MKTowerDefence
//
//  Created by Murakei on 2013/01/14.
//  Copyright (c) 2013年 Murakei. All rights reserved.
//

#import "MKMoveObjectTest.h"
#import "MKMoveObject.h"
#import "MKPoint.h"

@implementation MKMoveObjectTest

/*
 * 単純に右に移動する場合
 */
- (void)testMove1 {
    MKMoveObject *obj1 = [[MKMoveObject alloc] init];
    [obj1 setCurrentPoint:[MKPoint createWithX:0 andY:0]];
    obj1.speed = 3;
    [obj1 setTargetPoint:[MKPoint createWithX:10 andY:0]];
    [obj1 calcAngle];
    [obj1 rotate];
    [obj1 calcMovement];
    [obj1 move];
    STAssertTrue([[MKPoint createWithX:3 andY:0] compareTo:[obj1 currentPoint]], @"一度moveすると目標位置に向かってspeed分移動すること");
}
/*
 * ターゲットが途中で代わる場合
 */
- (void)testMove2 {
    MKMoveObject *obj1 = [[MKMoveObject alloc] init];
    [obj1 setCurrentPoint:[MKPoint createWithX:0 andY:0]];
    obj1.speed = 5;
    [obj1 setTargetPoint:[MKPoint createWithX:10 andY:0]];
    [obj1 calcAngle];
    [obj1 rotate];
    [obj1 calcMovement];
    [obj1 move];
    STAssertTrue([[MKPoint createWithX:5 andY:0] compareTo:[obj1 currentPoint]], @"一度moveすると目標位置に向かってspeed分移動すること");

    [obj1 setTargetPoint:[MKPoint createWithX:10 andY:10]];
//    [obj1 calcAngle];
    [obj1 calcMovement];
    [obj1 rotate];
    [obj1 move];
    STAssertTrue([[MKPoint createWithX:10 andY:0] compareTo:[obj1 currentPoint]], @"目標が変更した場合calcAngleしなければ同じ方向に向かってspeed分移動すること");

    [obj1 calcAngle];
    [obj1 rotate];
    [obj1 calcMovement];
    [obj1 move];
    STAssertTrue([[MKPoint createWithX:10 andY:5] compareTo:[obj1 currentPoint]], @"目標が変更した場合calcAngleしなければ同じ方向に向かってspeed分移動すること");
}

@end
