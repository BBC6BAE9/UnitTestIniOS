//
//  MarsRoverTests.m
//  MarsRoverTests
//
//  Created by huang on 2020/12/27.
//

#import <XCTest/XCTest.h>
#import "MarsRover.h"
#import "MarsBridge.h"
#import "MarsHeader.h"

@interface MarsRoverTests : XCTestCase

@end

@implementation MarsRoverTests

-(void)testRunCmdsStratPositionStartPositionStartDirection{
    MarsRover *rover = [[MarsRover alloc] init];
    {
        Position startPosition = {0, 0};
        DIREDRTION startDirection = DIREDRTION_S;
        SpatialInfo info = [rover runCmds:@"MRMMLLLL" stratPosition:startPosition startDirection:startDirection rangeX:100 rangeY:100 block:nil];
        XCTAssertTrue(info.position.x == 0);
        XCTAssertTrue(info.position.y == 1);
        XCTAssertTrue(info.direction == DIREDRTION_W);
    }
    {
        Position startPosition = {0, 0};
        DIREDRTION startDirection = DIREDRTION_S;
        
        SpatialInfo info = [rover runCmds:@"MRMMLLLL" stratPosition:startPosition startDirection:startDirection rangeX:0 rangeY:0 block:nil];
        XCTAssertTrue(info.position.x == 0);
        XCTAssertTrue(info.position.y == 0);
        XCTAssertTrue(info.direction == DIREDRTION_W);
    }
    {
        Position startPosition = {0, 0};
        DIREDRTION startDirection = DIREDRTION_S;
        
        SpatialInfo info = [rover runCmds:@"XXXXXXXX" stratPosition:startPosition startDirection:startDirection rangeX:0 rangeY:0 block:nil];;
        XCTAssertTrue(info.position.x == 0);
        XCTAssertTrue(info.position.y == 0);
        XCTAssertTrue(info.direction == DIREDRTION_S);
    }
    
    {
        Position startPosition = {0, 0};
        DIREDRTION startDirection = DIREDRTION_S;
        
        SpatialInfo info = [rover runCmds:@"MMMMMMMMMMMMMMMMMMMMMMMLR" stratPosition:startPosition startDirection:startDirection rangeX:5 rangeY:5 block:nil];
        XCTAssertTrue(info.position.x == 0);
        XCTAssertTrue(info.position.y == 4);
        XCTAssertTrue(info.direction == DIREDRTION_S);
        
    }
    
}

-(void)testTurn{
    MarsRover *rover = [[MarsRover alloc] init];
    {
        DIREDRTION direction = [rover turn:@"L" curDirection:DIREDRTION_E];
        XCTAssertTrue(direction == DIREDRTION_N,"turn:curDirection函数验证失败");
    }
    {
        DIREDRTION direction = [rover turn:@"L" curDirection:DIREDRTION_S];
        XCTAssertTrue(direction == DIREDRTION_E,"turn:curDirection函数验证失败");
    }
    
    {
        DIREDRTION direction = [rover turn:@"L" curDirection:DIREDRTION_W];
        XCTAssertTrue(direction == DIREDRTION_S,"turn:curDirection函数验证失败");
    }
    
    {
        DIREDRTION direction = [rover turn:@"L" curDirection:DIREDRTION_N];
        XCTAssertTrue(direction == DIREDRTION_W,"turn:curDirection函数验证失败");
    }
    
    {
        DIREDRTION direction = [rover turn:@"R" curDirection:DIREDRTION_E];
        XCTAssertTrue(direction == DIREDRTION_S,"turn:curDirection函数验证失败");
    }
    {
        DIREDRTION direction = [rover turn:@"R" curDirection:DIREDRTION_S];
        XCTAssertTrue(direction == DIREDRTION_W,"turn:curDirection函数验证失败");
    }
    
    {
        DIREDRTION direction = [rover turn:@"R" curDirection:DIREDRTION_W];
        XCTAssertTrue(direction == DIREDRTION_N,"turn:curDirection函数验证失败");
    }
    
    {
        DIREDRTION direction = [rover turn:@"R" curDirection:DIREDRTION_N];
        XCTAssertTrue(direction == DIREDRTION_E,"turn:curDirection函数验证失败");
    }
    {
        DIREDRTION direction = [rover turn:@"r" curDirection:DIREDRTION_N];
        XCTAssertTrue(direction == DIREDRTION_E,"turn:curDirection函数验证失败");
    }
    
    {
        DIREDRTION direction = [rover turn:@"x" curDirection:DIREDRTION_N];
        XCTAssertTrue(direction == -1,"turn:curDirection函数验证失败");
    }
    
}

-(void)testCanForward{
    MarsRover *rover = [[MarsRover alloc] init];
    {
        Position position = {0,0};
        [rover forwardCurDirection:DIREDRTION_E curPosition:position rangX:100 rangeY:100];
    }
    {
        Position position = {100,100};
        int rangeX = 100;
        int rangeY = 100;
        BOOL result = [rover canForwardCurPosition:position curDirection:DIREDRTION_E rangX:rangeX rangeY:rangeY];
        XCTAssertFalse(result);
    }
    {
        Position position = {0, 0};
        int rangeX = 100;
        int rangeY = 100;
        BOOL result = [rover canForwardCurPosition:position curDirection:DIREDRTION_W rangX:rangeX rangeY:rangeY];
        XCTAssertFalse(result);
    }
    {
        Position position = {0, 100};
        int rangeX = 100;
        int rangeY = 100;
        BOOL result = [rover canForwardCurPosition:position curDirection:DIREDRTION_W rangX:rangeX rangeY:rangeY];
        XCTAssertFalse(result);
    }
    {
        Position position = {0, 100};
        int rangeX = 100;
        int rangeY = 100;
        BOOL result = [rover canForwardCurPosition:position curDirection:DIREDRTION_E rangX:rangeX rangeY:rangeY];
        XCTAssertTrue(result);
    }
}

-(void)testForward{
    MarsRover *rover = [[MarsRover alloc] init];
    {
        Position position = {0,0};
        int rangeX = 0;
        int rangeY = 0;
        Position pisitionAfter = [rover forwardCurDirection:DIREDRTION_E curPosition:position rangX:rangeX rangeY:rangeY];
        XCTAssertTrue(pisitionAfter.x == position.x);
        XCTAssertTrue(pisitionAfter.y == position.y);
    }
    {
        Position position = {0,0};
        int rangeX = 100;
        int rangeY = 100;
        Position pisitionAfter = [rover forwardCurDirection:DIREDRTION_S curPosition:position rangX:rangeX rangeY:rangeY];
        XCTAssertTrue(pisitionAfter.x == 0);
        XCTAssertTrue(pisitionAfter.y == 1);
    }
}


@end
