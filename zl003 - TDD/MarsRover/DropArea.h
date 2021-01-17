//
//  DropArea.h
//  MarsRover
//
//  Created by huang on 2020/12/28.
//

#import <UIKit/UIKit.h>
#import "MarsHeader.h"

NS_ASSUME_NONNULL_BEGIN

@interface DropArea : UIView


/// 火星车当前位置
@property(nonatomic, assign)Position curPoint;
@property(nonatomic, assign)DIREDRTION curDirection;

- (instancetype)initWithX:(int)x Y:(int)y;

    
@end

NS_ASSUME_NONNULL_END
