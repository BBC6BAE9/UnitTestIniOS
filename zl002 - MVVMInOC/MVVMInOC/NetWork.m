//
//  NetWork.m
//  MVVMInOC
//
//  Created by huang on 2021/1/17.
//

#import "NetWork.h"

@interface NetWork()

@end

@implementation NetWork

+(void)score:(NSDictionary *)param suc:(void(^)(NSDictionary *))resultDic fail:(void(^)(NSError *error))error{
    //模拟网络请求
       dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
           if ([param[@"score"] intValue] > 0) {
               int from = 380000;
               int to = 390000;
               int x = arc4random() % (to - from + 1) + from;
               resultDic(@{@"score": @(x)});
           }else{
               NSError *errorInfo = [NSError errorWithDomain:@"-1" code:-1 userInfo:@{@"des":@"param invaild"}];
               error(errorInfo);
           }
       });

}

@end
