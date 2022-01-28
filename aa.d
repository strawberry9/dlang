module test;

import std;

void main()
{
    auto aaTable =
      ([
       "ownerB" : [ 100000002 : [1, 1, 0, 0, 0, 0, 0, 0],
                    100000001 : [1, 0, 0, 0, 0, 0, 0, 0]
                 ],
       "ownerC" : [ 100000007 : [1, 1, 1, 1, 1, 1, 1, 0],
                    100000006 : [1, 1, 1, 1, 1, 1, 0, 0]
                 ],
       "ownerA" : [ 100000005 : [1, 1, 1, 1, 1, 0, 0, 0],
                    100000003 : [1, 1, 1, 0, 0, 0, 0, 0],
                    100000004 : [1, 1, 1, 1, 0, 0, 0, 0]
                 ]
      ]);

    string[] orderedKeyPairSet;

    foreach (ref owner, ref key_value; aaTable.byPair)
    {
        foreach(ref key, ref value; key_value.byPair)
            orderedKeyPairSet ~= owner ~ ":" ~ key.to!string ~ ":" ~ value.to!string ~ ":" ~ value.sum.to!string;
    }

    orderedKeyPairSet.sort;

    foreach(ref str; orderedKeyPairSet)
        writeln(str);
    
    writeln;
}
