module test;
@safe:

import std.stdio : write, writeln;
import std.range : iota, array;
import std.algorithm : map;
import std.array : join;

void main()
{
    int n = 10;
    
    // create a string array containing n "x"s
    auto xString = iota(0, n).map!(_ => "x" ).array; 
    
    writeln("xString is a ", typeof(xString).stringof); // xString is a string[]
    
    writeln(xString.join()); // xxxxxxxxxx
   
}
