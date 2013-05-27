#import <Foundation/Foundation.h>
#import <curses.h>

#import "Timer.h"
#import "Snake.h"
#import "direction.h"
#import "Scene.h"

NSAutoreleasePool *pool;

Timer *timer;
Snake *snake;

SCREEN *screen;

void init() {
    initscr();
    
    cbreak();
    noecho();
    nodelay(stdscr, 1);
    curs_set(0);
    
    getch();
    
    pool = [[NSAutoreleasePool alloc] init];
        
    snake = [[Snake alloc] init];
        
    [Scene init];
        
    timer = [[Timer alloc] init];
    [timer start];
}


double delay = 0.2;

int main(int argc, char *arv[]) {

    init();
    
    int running = 1;
    
    int new  = 0;
    int old1 = 0;
    int old2 = 0;
    
    while(running) {
        old2 = old1;
        old1 = new;
        
	new = getch();
	
	if(old2 == 27 && old1 == 91 && new == 68) {
	    [snake setDir: LEFT];
	} else if(old2 == 27 && old1 == 91 && new == 65) {
	    //printf("Up");
	    [snake setDir: UP];
	} else if(old2 == 27 && old1 == 91 && new == 67) {
	    [snake setDir: RIGHT];
	    //printf("Right");
	} if(old2 == 27 && old1 == 91 && new == 66) {
	    [snake setDir: DOWN];
	    //printf("Down");
	}

	if([timer getTime] > delay) {
	    [timer reset];
	    [snake move];
	    
	    int headX = [snake getHeadX];
	    int headY = [snake getHeadY];
	    
	    if(headX <= MIN_X || headX >= MAX_X || headY <= MIN_Y || headY >= MAX_Y) {
		running = 0;
	    }
	    
	    setPos(0,0);
	    if(headX == [Scene getColX] && headY == [Scene getColY]) {
		[snake addLength];
		[snake addLength];
		delay -= 0.03;
		[Scene newCollectable];
	    }
	}
    }
    endwin();
    
    return 0;
}