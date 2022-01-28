// Distributed under the FREE_FOR_ANY_USE LICENCE Version 1.0.

module test;
@safe:

import std.stdio;

void pro(in immutable string[] strings, out immutable(string)*[] pointers) pure nothrow
{
    foreach(i, ref str; strings)
        if(str == "one") () @trusted { pointers ~= &str; }(); 
}

void main()
{
    immutable string[] strings = ["one", "one", "two", "one", "two", "two", "one", "one", "two", "two"];
    immutable(string)*[] pointers = null;

    pro(strings, pointers);
    
    foreach(size_t i, ref p; pointers)
        writefln("Address of p is: %s\t\tp points to: %s\t\twhose value is: %s", cast(size_t)&pointers[i], cast(size_t)pointers[i], *p);
}
