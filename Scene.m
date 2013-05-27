#import <Foundation/Foundation.h>
#import <stdlib.h>

#import "Scene.h"

@implementation Scene

static int col_x, col_y;

+(void) init {
	[Scene drawBoundary];
	[Scene newCollectable];
}

+(void) drawBoundary {
	
	int x,y;
	
	y = MIN_Y;
	for(x = MIN_X; x <= MAX_X; x++) {
	    setPos(x,y);
	    printf("x");
	    fflush(stdout);
	    usleep(10000);
	}
	
	x = MAX_X;
	for(y = MIN_Y; y <= MAX_Y; y++) {
	    setPos(x,y);
	    printf("x");
	    fflush(stdout);
	    usleep(25000);
	}
	
	y = MAX_Y;
	for(x = MAX_X; x >= MIN_X; x--) {
	    setPos(x,y);
	    printf("x");
	    fflush(stdout);
	    usleep(10000);
	}
	
	x = MIN_X;
	for(y = MAX_Y; y >= MIN_Y; y--) {
	    setPos(x,y);
	    printf("x");
	    fflush(stdout);
	    usleep(25000);
	}
	
	
	
	
}

+(void) newCollectable {
	col_x = MIN_X + arc4random_uniform(MAX_X - MIN_X + 1);
	col_y = MIN_Y + arc4random_uniform(MAX_Y - MIN_Y + 1);
	
	setPos(col_x, col_y);
	printf("+");
}

+(int) getColX {
	return col_x;
}

+(int) getColY {
	return col_y;
}

@end