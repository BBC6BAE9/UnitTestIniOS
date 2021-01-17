//
//  MarsRover.m
//  MarsRover
//
//  Created by huang on 2020/12/27.
//

#import "MarsRover.h"
#import "MarsHeader.h"
#import "NSString+Cmd.h"

/*
【指令】
 L：左转
 R：右转
 M：前进
 */


@implementation MarsRover

- (SpatialInfo)runCmds:(NSString *)cmdStr stratPosition:(Position)startPosition startDirection:(DIREDRTION)startDirection rangeX:(int)rangeX rangeY:(int)rangeY block:(void (^)(SpatialInfo info))block{

    NSArray *cmdArr = [cmdStr splitCmds];
    DIREDRTION curDirection = startDirection;
    Position curPosition = startPosition;
    for (NSString *cmd in cmdArr) {
        if (!([cmd isEqualToString:@"L"] || [cmd isEqualToString:@"R"] || [cmd isEqualToString:@"M"])) {
            SpatialInfo startInfo = {startPosition, startDirection};
            if (block) {
                block(startInfo);
            }
            
        }
        if ([cmd isEqualToString:@"L"] || [cmd isEqualToString:@"R"]) {
            curDirection = [self turn:cmd curDirection:curDirection];
            SpatialInfo thisTimeInfo = {curPosition, curDirection};
            if (block) {
                block(thisTimeInfo);
            }
        }
        if ([cmd isEqualToString:@"M"]) {
            curPosition = [self forwardCurDirection:curDirection curPosition:curPosition rangX:rangeX rangeY:rangeY];
            SpatialInfo thisTimeInfo = {curPosition, curDirection};
            if (block) {
                block(thisTimeInfo);
            }
        }
        
//        sleep(1);
    }
    SpatialInfo finalInfo = {curPosition, curDirection};
    return finalInfo;
}

/*
 函数E：转向
 输入：转向命令、当前方向
 输出：当前方向
 */
- (DIREDRTION)turn:(NSString *)cmd curDirection:(DIREDRTION)curDirection{
    cmd = [cmd uppercaseString];
    if (!([cmd isEqualToString:@"L"] || [cmd isEqualToString:@"R"])) {
        return  -1;
    }
    if ([cmd isEqualToString:@"L"]) {
        DIREDRTION direction = (curDirection + 3) % 4;
        return direction;
    }
    if ([cmd isEqualToString:@"R"]) {
        DIREDRTION direction = (curDirection + 5) % 4;
        return direction;
    }
    return  -1;
}

/*
 函数F：前进
 输入：当前的位置、方向、当前区域大小
 输出：当前的位置
 */
- (Position)forwardCurDirection:(DIREDRTION)curDirection curPosition:(Position)curPosition rangX:(int)rangeX rangeY:(int)rangeY {
    if (![self canForwardCurPosition:curPosition curDirection:curDirection rangX:rangeX rangeY:rangeY]) {
        return curPosition;
    }
    if (curDirection == DIREDRTION_E) {
        curPosition.x += 1;
    }else if (curDirection == DIREDRTION_S){
        curPosition.y += 1;
    }else if (curDirection == DIREDRTION_W){
        curPosition.x -= 1;
    }else{
        curPosition.y -= 1;
    }
    return curPosition;
}

/*
 函数G：是否可以前进
 输入：当前位置、方向
 输出：是否可以前进
 */
- (BOOL)canForwardCurPosition:(Position)curPosition curDirection:(DIREDRTION)curDirection rangX:(int)rangeX rangeY:(int)rangeY {
    // 区域为0
    if (rangeX == 0 & rangeY == 0) {
        return NO;
    }else if (curDirection == DIREDRTION_E) {
        return (curPosition.x < rangeX - 1);
    }else if (curDirection == DIREDRTION_W) {
        return (curPosition.x > 0);
    }else if (curDirection == DIREDRTION_N) {
        return (curPosition.y > 0);
    }else{
        return (curPosition.y < rangeY - 1);
    }
}

@end
