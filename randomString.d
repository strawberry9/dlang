module test;

import std.stdio : writeln;
import std.algorithm : map;
import std.ascii : letters;
import std.random : Random, unpredictableSeed, uniform;
import std.range : iota, array;

Random rnd;
static this() {  rnd = Random(unpredictableSeed); } 

void main()
{
    int howMany = 12;
    string charsToUse = letters ~ "!#$%" ~ "0123456789";
    writeln(iota(howMany).map!(_ => charsToUse[uniform(0, $, rnd)]).array);
}
