#import <Foundation/Foundation.h>

#import "Snake.h"
#import "direction.h"



@implementation Snake 

-(id) init {
	[super init];
	
	length = 6;
	direction = UP;
	tmpDir = UP;
	x = [NSMutableArray arrayWithObjects: [NSNumber numberWithInt: 30], [NSNumber numberWithInt: 30], [NSNumber numberWithInt: 30],[NSNumber numberWithInt: 30], [NSNumber numberWithInt: 30], [NSNumber numberWithInt: 30], nil];
	y = [NSMutableArray arrayWithObjects: [NSNumber numberWithInt: 30], [NSNumber numberWithInt: 30], [NSNumber numberWithInt: 30],[NSNumber numberWithInt: 30], [NSNumber numberWithInt: 30], [NSNumber numberWithInt: 30],[NSNumber numberWithInt: 30], [NSNumber numberWithInt: 30], [NSNumber numberWithInt: 30], nil];
	
	return self;
}

-(void) move {
	
	direction = tmpDir;

	int cx = [[x objectAtIndex: 0] intValue];
	int cy = [[y objectAtIndex: 0] intValue];
	
	int nx = 0, ny = 0;
	
	switch(direction) {
	case UP:
		ny = cy - 1;
		nx = cx;
		break;
	case DOWN:
		ny = cy + 1;
		nx = cx;
		break;
	case LEFT:
		ny = cy;
		nx = cx - 1;
		break;
	case RIGHT:
		ny = cy;
		nx = cx + 1;
		break;
	}
	
	int ox = [[x objectAtIndex: length -1] intValue];
	int oy = [[y objectAtIndex: length -1] intValue];
	
	setPos(ox, oy);
	printf(" ");
	
	[x removeLastObject];
	[y removeLastObject];
	
	[x insertObject: [NSNumber numberWithInt: nx] atIndex: 0];
	[y insertObject: [NSNumber numberWithInt: ny] atIndex: 0];
	
	setPos(nx, ny);
	printf("o");
	fflush(stdout);
	
}

-(int) getHeadX {
	return [[x objectAtIndex: 0] intValue];
	
}

-(int) getHeadY {
	return [[y objectAtIndex: 0] intValue];
	
}

-(void) setDir: (Direction) dir {
	if(direction == DOWN && dir == UP) return;
	if(direction == UP && dir == DOWN) return;
	if(direction == LEFT && dir == RIGHT) return;
	if(direction == RIGHT && dir == LEFT) return;
	tmpDir = dir;
}

-(void) addLength {
	[x addObject: [x objectAtIndex: length -1]];
	[y addObject: [y objectAtIndex: length -1]]; 
	length++;
}

@end