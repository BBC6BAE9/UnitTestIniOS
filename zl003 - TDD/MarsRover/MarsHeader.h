//
//  MarsHeader.h
//  MarsRover
//
//  Created by huang on 2020/12/27.
//

#ifndef MarsHeader_h
#define MarsHeader_h

//强弱引用
#define kWeakSelf(type)  __weak typeof(type) weak##type = type;
#define kStrongSelf(type) __strong typeof(type) type = weak##type;

typedef enum DIREDRTION {
    DIREDRTION_N = 0, // 北
    DIREDRTION_E, // 东
    DIREDRTION_S, // 南
    DIREDRTION_W, // 西
    DIREDRTION_UNKNOW
} DIREDRTION;

typedef struct{
    int x;
    int y;
} Position;

typedef struct{
    Position position;
    DIREDRTION direction;
} SpatialInfo;

#endif /* MarsHeader_h */
