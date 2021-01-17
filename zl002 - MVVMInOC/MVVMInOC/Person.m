//
//  Person.m
//  MVVMInOC
//
//  Created by huang on 2021/1/16.
//

#import "Person.h"

@implementation Person

-(instancetype)init{
    if ([super init]) {
        self.firstName = @"Kobe";
        self.lastName = @"Bryant";
        self.score = 33643;
    }
    return self;
}

-(void)newScore:(int)score{
    self.score = score;
    NSLog(@"%d",self.score);
}
@end
