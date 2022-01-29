module test;
@safe:
    
import std;

void main()
{
    auto OmicronAA =
      ([
       "BA.3" : [ ["G142D", "G339D", "S373P", "S375F", "S371F", "D405N"] : [1, 1, 1, 1, 1, 1],
                  ["D614G", "H655Y", "N679K", "P681H", "N764K", "D796Y"] : [1, 0, 1, 0, 1, 1]
                ],
       "BA.2" : [ ["G142D", "G339D", "S373P", "S375F", "S371F", "D405N"] : [1, 1, 1, 1, 1, 1],
                  ["D614G", "H655Y", "N679K", "P681H", "N764K", "D796Y"] : [1, 0, 1, 0, 1, 0]
                ],
       "BA.1" : [ ["G142D", "G339D", "S373P", "S375F", "S371F", "D405N"] : [1, 0, 0, 1, 0, 0],
                  ["D614G", "H655Y", "N679K", "P681H", "N764K", "D796Y"] : [1, 1, 0, 1, 0, 0]
                ]
      ]);

    string[] orderedKeyPairSet;

    foreach (ref owner, ref key_value; OmicronAA.byPair)
    {
        foreach(ref key, ref value; key_value.byPair)
            orderedKeyPairSet ~= owner ~ ":" ~ key.to!string ~ ":" ~ value.to!string ~ ":" ~ value.sum.to!string;
    }

    orderedKeyPairSet.sort;

    foreach(ref str; orderedKeyPairSet)
        writeln(str);
    
    writeln;
}

/+
outputs this:

BA.1:["D614G", "H655Y", "N679K", "P681H", "N764K", "D796Y"]:[1, 1, 0, 1, 0, 0]:3
BA.1:["G142D", "G339D", "S373P", "S375F", "S371F", "D405N"]:[1, 0, 0, 1, 0, 0]:2
BA.2:["D614G", "H655Y", "N679K", "P681H", "N764K", "D796Y"]:[1, 0, 1, 0, 1, 0]:3
BA.2:["G142D", "G339D", "S373P", "S375F", "S371F", "D405N"]:[1, 1, 1, 1, 1, 1]:6
BA.3:["D614G", "H655Y", "N679K", "P681H", "N764K", "D796Y"]:[1, 0, 1, 0, 1, 1]:4
BA.3:["G142D", "G339D", "S373P", "S375F", "S371F", "D405N"]:[1, 1, 1, 1, 1, 1]:6

+/
