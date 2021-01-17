//
//  MarsRover.h
//  MarsRover
//
//  Created by huang on 2020/12/27.
//

#import <Foundation/Foundation.h>
#import "MarsHeader.h"

NS_ASSUME_NONNULL_BEGIN

@interface MarsRover : NSObject

- (SpatialInfo)runCmds:(NSString *)cmdStr stratPosition:(Position)startPosition startDirection:(DIREDRTION)startDirection rangeX:(int)rangeX rangeY:(int)rangeY block:(void (^)(SpatialInfo info))block;
    
@end

NS_ASSUME_NONNULL_END
