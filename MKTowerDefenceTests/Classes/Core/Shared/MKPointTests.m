//
//  MKPointTests.m
//  MKTowerDefence
//
//  Created by Murakei on 2013/01/14.
//  Copyright (c) 2013年 Murakei. All rights reserved.
//

#import "MKPointTests.h"
#import "MKPoint.h"

@implementation MKPointTests

- (void)setUp {
    [super setUp];
    // Set-up code here.
}

- (void)tearDown {
    // Tear-down code here.
    [super tearDown];
}

- (void)testCreate {
    MKPoint *mkPoint = [MKPoint createWithX:0 andY:0];
    STAssertNotNil(mkPoint, @"インスタンスを座標(0,0)で生成できること");
}

- (void)testCalcDistance {
    MKPoint *point0 = [[MKPoint alloc] init];
    MKPoint *point1 = [MKPoint createWithX:0 andY:0];
    MKPoint *point2 = [MKPoint createWithX:100 andY:0];
    MKPoint *point3 = [MKPoint createWithX:100 andY:100];
    STAssertEquals((float) 0, [point0 calcDistanceTo:point1], @"値が設定されていないpointとの距離は0とすること");
    STAssertEquals((float) 0, [point1 calcDistanceTo:point0], @"値が設定されていないpointとの距離は0とすること");
    STAssertEquals((float) 100, [point1 calcDistanceTo:point2], @"２点間の距離が正しく計測されること(X方向)");
    STAssertEquals((float) 141.421356, [point1 calcDistanceTo:point3], @"２点間の距離が正しく計測されること(ナナメ方向)");
    STAssertEquals((float) 0, [point1 calcDistanceTo:nil], @"nilとの比較の場合は0を返すこと");
}

- (void)testCalcAngle {
    MKPoint *point0 = [[MKPoint alloc] init];
    MKPoint *point1 = [MKPoint createWithX:0 andY:0];
    STAssertEquals((float) 0, [point0 calcAngleTo:point1], @"値が設定されていないpointとの角度は0とすること");
    STAssertEquals((float) 0, [point1 calcAngleTo:point0], @"値が設定されていないpointとの角度は0とすること");
    STAssertEquals((float) 0, [point1 calcAngleTo:[MKPoint createWithX:100 andY:0]], @"２点間の角度が正しく計測されること(０度)");
    STAssertEquals((float) M_PI_4, [point1 calcAngleTo:[MKPoint createWithX:100 andY:100]], @"２点間の角度が正しく計測されること(45度)");
    STAssertEquals((float) M_PI_2, [point1 calcAngleTo:[MKPoint createWithX:0 andY:100]], @"２点間の角度が正しく計測されること(90度)");
    STAssertEquals((float) (M_PI_2 + M_PI_4), [point1 calcAngleTo:[MKPoint createWithX:-100 andY:100]], @"２点間の角度が正しく計測されること(135度)");
    STAssertEquals((float) M_PI, [point1 calcAngleTo:[MKPoint createWithX:-100 andY:0]], @"２点間の角度が正しく計測されること(180度)");
    
    STAssertEquals((float) -M_PI_4, [point1 calcAngleTo:[MKPoint createWithX:100 andY:-100]], @"２点間の角度が正しく計測されること(315度(-45))");
    STAssertEquals((float) -M_PI_2, [point1 calcAngleTo:[MKPoint createWithX:0 andY:-100]], @"２点間の角度が正しく計測されること(270(-90)度)");
//    STAssertEquals((float) -(M_PI_2 + M_PI_4), [point1 calcAngleTo:[MKPoint createWithX:-100 andY:-100]], @"２点間の角度が正しく計測されること(225(-135)度)");
    STAssertEquals((float) M_PI, [point1 calcAngleTo:[MKPoint createWithX:-100 andY:0]], @"２点間の角度が正しく計測されること(180(-180度)");

    STAssertEquals((float) 0, [point1 calcAngleTo:nil], @"nilとの比較の場合は0を返すこと");
}

@end
