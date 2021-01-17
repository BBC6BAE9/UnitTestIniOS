//
//  NetWork.h
//  MVVMInOC
//
//  Created by huang on 2021/1/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
struct NET_ERROR {
    int errorCode; // 错误码
    NSString *errorMsg; // 错误信息
};
@interface NetWork : NSObject

+(void)score:(NSDictionary *)param suc:(void(^)(NSDictionary *))resultDic fail:(void(^)(NSError *error))error;

@end

NS_ASSUME_NONNULL_END
