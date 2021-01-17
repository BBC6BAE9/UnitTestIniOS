//
//  ViewController.m
//  MarsRover
//
//  Created by huang on 2020/12/27.
//

#import "ViewController.h"
#import "DropArea.h"
#import "MarsRover.h"

#define map_x 5
#define map_y 5

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    DropArea *area = [[DropArea alloc] initWithX:map_x Y:map_y];
    area.center = self.view.center;
    area.backgroundColor = [UIColor redColor];
    [self.view addSubview:area];
    
//    Position point = {0, 1};
//    area.curPoint = point;
    
    Position startPosition = {0, 0};
    DIREDRTION startDirection = DIREDRTION_S;
    MarsRover *rover = [[MarsRover alloc] init];
    area.curDirection = startDirection;
    area.curPoint = startPosition;
    kWeakSelf(area)
    [rover runCmds:@"MMMMLMMMMMLMMLMMRMMLMML" stratPosition:startPosition startDirection:startDirection rangeX:map_x rangeY:map_y block:^(SpatialInfo info) {
        weakarea.curPoint = info.position;
        weakarea.curDirection = info.direction;
        NSLog(@"------%d", info.position.x);
        NSLog(@"------%d", info.position.y);
    }];
    
}



@end
