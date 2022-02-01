module test;
@safe:

import std.stdio : writeln, writefln;
import std.process : environment;

// This searches your environment variables for 'key'

void main()
{
    // NOTE: DLANG_BACKTRAC is 'not' a valid env variable in dlang.
    string key = "DLANG_BACKTRACE"; 
    
    if (key in environment)
    {
        writefln("%s=%s", key, environment[key]);
        
        if (environment[key] != "1")
            writefln("set %s=1  (if you want to see stack trace output)", key);
    }
    else
        writefln("%s not found.", key);
               
}

