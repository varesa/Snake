#import <Foundation/Foundation.h>


#import "direction.h"


@class Snake;

@interface Snake : NSObject {
    int length;
    
    Direction tmpDir;
    Direction direction;
    NSMutableArray *x;
    NSMutableArray *y;
}

-(void) move;
-(int) getHeadX;
-(int) getHeadY;
-(void) setDir: (Direction) dir;
-(void) addLength;

@end