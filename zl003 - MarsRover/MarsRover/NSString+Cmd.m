//
//  NSString+Cmd.m
//  MarsRover
//
//  Created by huang on 2020/12/28.
//

#import "NSString+Cmd.h"

@implementation NSString (Cmd)

- (NSArray *)splitCmds{
    
    NSMutableArray *arr = @[].mutableCopy;
    for (int i = 0; i< self.length; i++) {
        NSString *cha = [self substringWithRange:NSMakeRange(i,1)];
        [arr addObject:cha];
    }
    return [arr copy];

}

@end
