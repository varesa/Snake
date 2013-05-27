#import <Foundation/Foundation.h>

@class Timer;

@interface Timer : NSObject {

    NSDate *start;

}

- (void) start;
- (void) reset;
- (double) getTime;

@end