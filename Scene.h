#import <Foundation/Foundation.h>


#define MIN_X 2
#define MAX_X 100

#define MIN_Y 2
#define MAX_Y 50



@class Scene;

@interface Scene : NSObject { }

+(void) init;
+(void) drawBoundary;

+(void) newCollectable;
+(int)  getColX;
+(int)  getColY;

@end