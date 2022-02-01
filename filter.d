module test;
@safe:

import std;

void main()
{
    string[] strings = [ "one", "", "two", "", "", "three", ""];
    writeln(strings.length); // 7

    strings = strings.filter!(a => !a.empty).array;
    writeln(strings.length); // 3
    
    foreach(str; strings)
        writeln(str);
}

/+

7
3
one
two
three

+/
