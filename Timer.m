#import <Foundation/Foundation.h>

#import "Timer.h"

@implementation Timer

- (void) start {
    start = [NSDate date];
}

- (void) reset {
    [self start];
}

- (double) getTime {
    return [[NSDate date] timeIntervalSinceDate:start];
    //return 1000;
}

@end