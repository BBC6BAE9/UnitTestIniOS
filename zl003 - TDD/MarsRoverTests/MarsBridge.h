//
//  MarsBridge.h
//  MarsRover
//
//  Created by huang on 2020/12/27.
//

#ifndef MarsBridge_h
#define MarsBridge_h
#import "MarsRover.h"

@interface MarsRover()

- (SpatialInfo)runCmds:(NSString *)cmdStr stratPosition:(Position)startPosition startDirection:(DIREDRTION)startDirection rangeX:(int)rangeX rangeY:(int)rangeY block:(void (^)(SpatialInfo info))block;

- (DIREDRTION)turn:(NSString *)cmd curDirection:(DIREDRTION)curDirection;

- (Position)forwardCurDirection:(DIREDRTION)curDirection curPosition:(Position)curPosition rangX:(int)rangeX rangeY:(int)rangeY;

- (BOOL)canForwardCurPosition:(Position)curPosition curDirection:(DIREDRTION)curDirection rangX:(int)rangeX rangeY:(int)rangeY;

@end

#endif /* MarsBridge_h */
