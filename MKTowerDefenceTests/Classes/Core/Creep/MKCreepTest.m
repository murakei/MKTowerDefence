//
//  MKCreepTest.m
//  MKTowerDefence
//
//  Created by Murakei on 2013/01/14.
//  Copyright (c) 2013年 Murakei. All rights reserved.
//

#import "MKCreepTest.h"
#import "MKCreepFactory.h"
#import "MKCourse.h"
#import "MKCreep.h"
#import "MKPoint.h"

@implementation MKCreepTest

- (void)testAction {
    MKCreepFactory *factory = [[MKCreepFactory alloc] initWithCourse:[MKCourse createSampleCourse]];
    MKCreep *creep = [factory createWithCommand:@""];
    [creep setStartPoint];
    STAssertTrue([[creep currentPoint] compareTo:[MKPoint createWithX:100 andY:100]],
                 @"コースに応じて移動する");
    [creep action];
    STAssertTrue([[creep currentPoint] compareTo:[MKPoint createWithX:100 andY:101]],
                 @"コースに応じて移動する");
}

- (void)testActionShortCourse {
    MKCourse *shortCourse = [[MKCourse alloc] init];
    [shortCourse addPoint:[MKPoint createWithX:0 andY:0]];
    [shortCourse addPoint:[MKPoint createWithX:1 andY:0]];
    [shortCourse addPoint:[MKPoint createWithX:1 andY:1]];
    [shortCourse addPoint:[MKPoint createWithX:0 andY:1]];
    [shortCourse addPoint:[MKPoint createWithX:0 andY:0]];
    MKCreepFactory *factory = [[MKCreepFactory alloc] initWithCourse:shortCourse];
    MKCreep *creep = [factory createWithCommand:@""];
    [creep setStartPoint];
    STAssertTrue([[creep currentPoint] compareTo:[MKPoint createWithX:0 andY:0]],
                 @"コースに応じて移動する");
    [creep action];
    STAssertTrue([[creep currentPoint] compareTo:[MKPoint createWithX:1 andY:0]],
                 @"コースに応じて移動する");
    [creep action];
    STAssertTrue([[creep currentPoint] compareTo:[MKPoint createWithX:1 andY:1]],
                 @"コースに応じて移動する");
    [creep action];
    STAssertTrue([[creep currentPoint] compareTo:[MKPoint createWithX:0 andY:1]],
                 @"コースに応じて移動する");
    [creep action];
    STAssertTrue([[creep currentPoint] compareTo:[MKPoint createWithX:0 andY:0]],
                 @"コースに応じて移動する");
}


@end
