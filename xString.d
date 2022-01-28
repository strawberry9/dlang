module test;
@safe:

import std.stdio : write;
import std.range : iota, array;
import std.algorithm : map;

void main()
{
    int n = 10;
    
    // create a string containing n "x"s
    auto xString = iota(0, n).map!(_ => "x" ).array; 
    
    foreach(el; xString)
        write(el);
}
