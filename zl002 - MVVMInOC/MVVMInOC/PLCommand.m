//
//  PLCommand.m
//  MVVMInOC
//
//  Created by huang on 2021/1/17.
//

#import "PLCommand.h"
 
@interface PLCommand()
 
@property (nonatomic,copy) PLCommandConsumeBlock consumeHandler;/**< 执行的block*/
@property (nonatomic,copy) PLCommandCancelBlock cancelHandler;/**< 取消*/
@property (nonatomic,copy) PLCommandCompletionBlock completionHandler;/**< 成功*/
 
@property (nonatomic,copy) PLCommandPrepareBlock prepareHandler;/**< 预执行block*/
@property (nonatomic,copy) PLCommandCompletionBlock subscribeNextHandler;/**< 订阅结果block*/
 
@end
 
@implementation PLCommand
 
- (instancetype)initWithConsumeHandler:(PLCommandConsumeBlock)consumeHandler {
    self = [super init];
    if (!self) {
        return nil;
    }
    _consumeHandler = consumeHandler;
    return self;
}
 
- (instancetype)initWithConsumeHandler:(PLCommandConsumeBlock)consumeHandler cancelHandler:(PLCommandCancelBlock)cancelHandler {
    self = [super init];
    if (!self) {
        return nil;
    }
    _consumeHandler = consumeHandler;
    _cancelHandler = cancelHandler;
    return self;
}
 
- (void)execute:(id)input {
    if (self.consumeHandler) {
        self.consumeHandler(input,self.completionHandler);
    }
    if (self.prepareHandler) {
        self.prepareHandler();
    }
}
 
- (void)sendNext:(id)input error:(NSError *)error {
    if (self.subscribeNextHandler) {
        self.subscribeNextHandler(error, input);
    }
}
 
- (void)prepare:(PLCommandPrepareBlock)prepareblock subscribeNext:(PLCommandCompletionBlock)completionHandler {
    self.prepareHandler = prepareblock;
    self.subscribeNextHandler = completionHandler;
}
 
- (void)cancel {
    //取消请求
    if (self.cancelHandler) {
        self.cancelHandler();
    }
}
 
@end
