CXX = g++
CXXFLAGS = -std=c++11 -Wall
TARGET = secfunc
SRC = main.cpp func.cpp

all: $(TARGET)

$(TARGET): $(SRC)
  $(CXX) $(CXXFLAGS) -o $(TARGET) $(SRC)

clean:
  rm -f $(TARGET)