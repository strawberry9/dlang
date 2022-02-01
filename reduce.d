module test;
@safe:

import std;

void main()
{
    static int[5] arr = [5, 1, 5, 5, 1];
    
    // This example passes in a string as a template argument
    writeln(arr.reduce!`a + b`); // 17

    // Or, you can pass in a lambda expression
    writeln(arr.reduce!((a,b) => (a + b))); // 17
}
