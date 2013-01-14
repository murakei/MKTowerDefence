//
//  MKCourseTest.m
//  MKTowerDefence
//
//  Created by Murakei on 2013/01/14.
//  Copyright (c) 2013年 Murakei. All rights reserved.
//

#import "MKCourseTest.h"
#import "MKCourse.h"
#import "MKPoint.h"

@implementation MKCourseTest

- (void)testCourse {
    MKCourse *course = [[MKCourse alloc] init];
    STAssertNotNil(course, @"コースを生成できること");
    [course addPoint:[MKPoint createWithX:0 andY:0]];
    [course addPoint:[MKPoint createWithX:100 andY:100]];
    [course addPoint:[MKPoint createWithX:200 andY:200]];
    MKPoint *firstPoint = [course nextPoint];
    MKPoint *secondPoint = [course nextPoint];
    MKPoint *thirdPoint = [course nextPoint];
    MKPoint *fourthPoint = [course nextPoint];
    STAssertTrue([firstPoint compareTo:[MKPoint createWithX:0 andY:0]], @"目標地点を取得できること(1)");
    STAssertTrue([secondPoint compareTo:[MKPoint createWithX:100 andY:100]], @"目標地点を取得できること(2)");
    STAssertTrue([thirdPoint compareTo:[MKPoint createWithX:200 andY:200]], @"目標地点を取得できること(3)");
    STAssertNil(fourthPoint, @"目標地点を取得できること(1)");
}

@end
