#import <Foundation/Foundation.h>

void setPos(int x, int y) {
	printf("\033[%i;%if", y, x);
}

void setColor(int fg, int bg) {
	printf("\033[3%i;%im", fg, bg);
}