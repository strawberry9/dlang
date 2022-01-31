module test;
@safe:

import std.stdio;

void doit(in immutable string[] strings, out immutable(string)*[] pointers) pure nothrow
{
    foreach(i, ref str; strings)
        if(str == "one")
            () @trusted { pointers ~= &str; } (); // this is an inline 'trusted escape', to allows @system calls
}

void main()
{
    immutable string[] strings = ["one", "one", "two", "one", "two", "two", "one", "one", "two", "two"];
    immutable(string)*[] pointers = null;

    doit(strings, pointers);
    
    foreach(size_t i, ref p; pointers)
        writefln("Address of p is: %s\t\tp points to: %s\t\twhose value is: %s", cast(size_t)&pointers[i], cast(size_t)pointers[i], *p);
}

/+
output from above:

Address of p is: 32452608		p points to: 32444416		whose value is: one
Address of p is: 32452616		p points to: 32444432		whose value is: one
Address of p is: 32452624		p points to: 32444464		whose value is: one
Address of p is: 32452632		p points to: 32444512		whose value is: one
Address of p is: 32452640		p points to: 32444528		whose value is: one

+/
