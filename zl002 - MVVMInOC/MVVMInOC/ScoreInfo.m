//
//  ScoreInfo.m
//  MVVMInOC
//
//  Created by huang on 2021/1/16.
//

#import "ScoreInfo.h"
#import "PLCommand.h"
#import "NetWork.h"

@interface ScoreInfo()


@end

@implementation ScoreInfo

-(instancetype)init{
    if ([super init]) {
        _person = [[Person alloc] init];
        [self initialize];
    }
    return self;
}


-(void)initialize{
    self.scoreCmd = [[PLCommand alloc] initWithConsumeHandler:^(id input, PLCommandCompletionBlock completionHandler) {
        [self newScore:[input intValue]];
        //        self.account = input;
        //        [self checkSubmitEnable];
    }];
}
-(NSString *)displayText{
    return [NSString stringWithFormat:@"%@ %@总得分:%d", _person.firstName,_person.lastName,_person.score];
}

-(void)newScore:(int)score{

    NSDictionary *param = @{@"score":@(score)};
    [NetWork score:param suc:^(NSDictionary * _Nonnull result){
        [self.person newScore:[result[@"score"] intValue]];
        
        [self.scoreCmd sendNext:nil error:nil];

    } fail:^(NSError * _Nonnull error){
        [self.scoreCmd sendNext:nil error:error];
    }];
}

-(void)net{
    
}
@end
