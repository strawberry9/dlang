module test;
@safe:

import std.stdio : write, writeln;
import std.range : iota, array;
import std.algorithm : map;
import std.array : join;

void main()
{
    int n = 10;
    
    // create a char array containing n 'x's
    auto xString = iota(0, n).map!(_ => 'x' ).array; 
    
    writeln("xString is a ", typeof(xString).stringof); //xString is a char[]
    writeln(xString);
    
    // change it into a 'z' string
    xString[0..$] = 'z';
    writeln(xString); // xxxxxzzzzz
}
