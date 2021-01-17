//
//  ScoreInfo.h
//  MVVMInOC
//
//  Created by huang on 2021/1/16.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import "PLCommand.h"

NS_ASSUME_NONNULL_BEGIN

@interface ScoreInfo : NSObject

@property(nonatomic,strong) PLCommand *scoreCmd;
@property(nonatomic, strong)Person *person;
@property(nonatomic, copy)NSString *displayText;

@end

NS_ASSUME_NONNULL_END
