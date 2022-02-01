module test;
@safe:

import std;

// Memoizes a function so as to avoid repeated computation
// https://dlang.org/library/std/functional/memoize.html

void main()
{
    string srcDir = "D:\\My Documents\\D";
    
    //auto dFiles = memoize!(() => srcDir.dirEntries("*.{d, di}", SpanMode.depth).map!(e => e.name).array);
    // can't use above in module @safe: due to memoize being a @system function. Will use trusted wrapper below instead.
    
    string[] dFiles;
    () @trusted { dFiles = memoize!(() => srcDir.dirEntries("*.{d, di}", SpanMode.depth).map!(e => e.name).array);  } (); 

    dFiles.sort;
    
    size_t counter;
    foreach(f; dFiles)
    {   
        counter++;
        writeln(f);
    }
    
    writeln;
    writefln("Found %s files.", counter);
}

/+
example output:

D:\My Documents\D\codesamples\concurrency.1.d
D:\My Documents\D\codesamples\concurrency.10.d
D:\My Documents\D\codesamples\concurrency.11.d
D:\My Documents\D\codesamples\concurrency.12.d
D:\My Documents\D\codesamples\concurrency.13.d
D:\My Documents\D\codesamples\concurrency.14.d
D:\My Documents\D\codesamples\concurrency.15.d
D:\My Documents\D\codesamples\concurrency.16.d
..
...
....

+/
