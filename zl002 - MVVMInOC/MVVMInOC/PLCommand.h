//
//  PLCommand.h
//  MVVMInOC
//
//  Created by huang on 2021/1/17.
//

#import <Foundation/Foundation.h>
/**
 *  成功时的回调block
 *
 *  @param error 错误
 *  @param content 内容
 */
typedef void(^PLCommandCompletionBlock)(id error,id content);
/**
 *  执行的block
 *
 *  @param input             输入
 *  @param completionHandler 完成结果
 */
typedef void(^PLCommandConsumeBlock)(id input,PLCommandCompletionBlock completionHandler);
 
/**
 *  预执行的block
 */
typedef void(^PLCommandPrepareBlock)(void);
 
/**
 *  取消的block
 */
typedef void(^PLCommandCancelBlock)(void);
 
 
/**
 *  封装逻辑
 */
@interface PLCommand : NSObject
 
/**
 *   初始化
 *
 *  @param consumeHandler 处理事件
 *
 *  @return 对象
 */
- (instancetype)initWithConsumeHandler:(PLCommandConsumeBlock)consumeHandler;
/**
 *  带取消操作
 *
 *  @param consumeHandler 处理事件
 *  @param cancelHandler 取消事件
 *
 *  @return 对象
 */
- (instancetype)initWithConsumeHandler:(PLCommandConsumeBlock)consumeHandler cancelHandler:(PLCommandCancelBlock)cancelHandler;
/**
 *  发起执行
 *
 *  @param input 数据
 */
- (void)execute:(id)input;
 
/**
 发布执行结果
 @param input 数据
 @param error 错误信息
 */
- (void)sendNext:(id)input error:(NSError *)error;
 
 
/**
 监听执行结果
 @param prepareblock 预执行 execute触发时候回调
 @param completionHandler 执行完毕 sendNext触发时回调
 */
- (void)prepare:(PLCommandPrepareBlock)prepareblock subscribeNext:(PLCommandCompletionBlock)completionHandler;
 
/**
 *  取消
 */
- (void)cancel;
 
@end

