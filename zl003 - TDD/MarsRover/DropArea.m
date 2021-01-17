//
//  DropArea.m
//  MarsRover
//
//  Created by huang on 2020/12/28.
//

#import "DropArea.h"
#import "MarsHeader.h"

#define SQUARE_WIDTH 60
@interface DropArea()

@property(nonatomic, strong)NSMutableArray *views;
@property(nonatomic, strong)UILabel *marsRover;
@property(nonatomic, assign)int x;
@property(nonatomic, assign)int y;
@property (nonatomic, strong) NSOperationQueue *opQueue;

@end

@implementation DropArea

- (instancetype)initWithX:(int)x Y:(int)y{
    if ([super initWithFrame:CGRectMake(0, 0, x * SQUARE_WIDTH, y * SQUARE_WIDTH)]) {
        [self createSubviewsX:x Y:y];
    }
    return self;
}

- (void)createSubviewsX:(int)x Y:(int)y{
    for (int i = 0; i<y; i++) {
        for (int j = 0; j < x; j++) {
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(j * SQUARE_WIDTH, i * SQUARE_WIDTH, SQUARE_WIDTH, SQUARE_WIDTH)];
            [self addSubview:view];
            view.backgroundColor = [UIColor yellowColor];
            view.layer.borderColor=[[UIColor blueColor]CGColor];
            view.layer.borderWidth=1;
            [self.views addObject:view];
        }
    }
    UILabel *marsRover = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, SQUARE_WIDTH, SQUARE_WIDTH)];
    marsRover.textAlignment = NSTextAlignmentCenter;
    marsRover.text = @"";
    self.marsRover = marsRover;
    [self addSubview:marsRover];
    marsRover.backgroundColor = [UIColor blueColor];
}

- (instancetype)init{
    if ([super init]) {
        self.views = @[].mutableCopy;
    }
    return self;
}

- (UIView *)getDropViewWith:(int)x Y:(int)y{
    return self;
}

-(void)setCurPoint:(Position)curPoint{
    
    
    NSBlockOperation *op = [NSBlockOperation blockOperationWithBlock:^{
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:1 animations:^{
                self.marsRover.frame = CGRectMake(curPoint.x * SQUARE_WIDTH, curPoint.y * SQUARE_WIDTH, SQUARE_WIDTH, SQUARE_WIDTH);
            } completion:^(BOOL finished) {
                    
            }];
        });
        sleep(1);
      }];
      [self.opQueue addOperation:op];
    
    
    
}

-(void)setCurDirection:(DIREDRTION)curDirection{
    NSBlockOperation *op = [NSBlockOperation blockOperationWithBlock:^{
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:1 animations:^{
                NSString *directionText = @"";
                switch (curDirection) {
                    case DIREDRTION_E:
                        directionText = @"➡️";
                        break;
                    case DIREDRTION_S:
                        directionText = @"⬇️";
                        break;
                    case DIREDRTION_W:
                        directionText = @"⬅️";
                        break;
                    case DIREDRTION_N:
                        directionText = @"⬆️";
                        break;
                        
                    default:
                        break;
                }
                self.marsRover.text = directionText;
            } completion:^(BOOL finished) {
                    
            }];
        });
        sleep(1);
      }];
      [self.opQueue addOperation:op];
}

- (NSOperationQueue *)opQueue{
    if (!_opQueue) {
        _opQueue = [[NSOperationQueue alloc]init];
        //设置为串行效果，按顺序执行
        _opQueue.maxConcurrentOperationCount = 1;
    }
    return _opQueue;
}
@end
