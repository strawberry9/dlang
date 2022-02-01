module test;
@safe:

import std;

void main()
{
    string[] strings = [ "one", "", "two", "", "", "three", ""];
    strings= strings.filter!(a => !a.empty).array;
    
    foreach(str; strings)
        writeln(str);
}

/+

one
two
three

+/
