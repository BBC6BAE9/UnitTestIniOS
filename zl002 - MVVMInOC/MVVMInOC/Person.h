//
//  Person.h
//  MVVMInOC
//
//  Created by huang on 2021/1/16.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property(nonatomic, copy)NSString *firstName;
@property(nonatomic, copy)NSString *lastName;
@property(nonatomic, assign)int score;

-(void)newScore:(int)score;
@end

NS_ASSUME_NONNULL_END
