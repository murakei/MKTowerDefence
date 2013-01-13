//
//  MKPointTests.m
//  MKTowerDefence
//
//  Created by Muradome on 2013/01/14.
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

@end
