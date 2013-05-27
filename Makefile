
#Directory for *.o, *.d, etc.
BUILD=build

SOURCES=Snake.m control.m main.m Timer.m Scene.m
EXECUTABLE=snake

OBJECTS=$(addprefix $(BUILD)/,$(SOURCES:.m=.o))
DEPFILES=$(addprefix $(BUILD)/,$(SOURCES:.m=.d))


CC=gcc
LIBS=-lobjc -lgnustep-base -lcurses -lbsd
CFLAGS=-fconstant-string-class=NSConstantString -Wall -MMD

all: $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS)
	$(CC) $(CFLAGS) $(LIBS) $(OBJECTS) -o $(EXECUTABLE)

$(OBJECTS): $(BUILD)/%.o: %.m | $(BUILD)
	$(CC) $(CFLAGS) -c $< -o $@

$(BUILD):
	-mkdir $(BUILD)

clean:
	rm $(EXECUTABLE) $(BUILD) -r

-include $(DEPFILES)