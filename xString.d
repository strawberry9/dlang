module test;
@safe:

import std.stdio : writeln;
import std.range : iota, array;
import std.algorithm : map;

void main()
{
    int n = 10;
    
    // create a char array containing n 'x's
    auto xString = iota(0, n).map!(_ => 'x' ).array; 
    
    writeln("xString is a ", typeof(xString).stringof); //xString is a char[]
    writeln(xString); // xxxxxxxxxx
    
    // change that first 5 'x' to 'z'
    xString[0..5] = 'z';
    writeln(xString); // zzzzzxxxxx
}

/+
output is:

xString is a char[]
xxxxxxxxxx
zzzzzxxxxx

+/
