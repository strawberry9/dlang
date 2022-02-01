module test;
@safe:

import std.stdio : writeln, writefln;
import std.process : environment;

// This searches your environment variables for 'key'
// and writes its value out to the console.

void main()
{
    string key = "DLANG_BACKTRACE";
    
    if (key in environment)
        writeln(environment[key]);
    else
        writefln("%s not found.", key);
               
}
