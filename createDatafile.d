// Distributed under the FREE_FOR_ANY_USE LICENCE Version 1.0.

module test;
@safe:

import std.stdio : write, writef, writeln, writefln;
import std.range : iota, enumerate;
import std.array : Appender, appender, staticArray;
import std.random : Random, unpredictableSeed, dice;
import std.algorithm : map;
import std.conv : to;
import std.format;
import std.stdio : File;
import std.file : exists;
import std.exception : enforce;

debug { import std; }

void main(string[] args)
{
    int recordsNeeded, valuesPerRecord;
    string fname;
    
    if(args.length < 4) // then set defaults
    {
        recordsNeeded = 10;
        valuesPerRecord= 8;
        
        version(Windows) { fname = "D:/rnd_records.txt"; }
        version(linux) { fname = "./rnd_records.txt"; }
    }
    else
    {
        // assumes valid values being passed in ;-)
        recordsNeeded = to!int(args[1]);
        valuesPerRecord = to!int(args[2]);
        fname = args[3];
    }
        
    debug
        { writefln("%s records (where a record is: id and %s values), will be written to file: %s", recordsNeeded, valuesPerRecord, fname); }
    else
        {
            enforce(!exists(fname), "Oops! That file already exists!");
            enforce(recordsNeeded <= 1_000_000_000, "C'mon! That's too many records!");
        }
    
    CreateDataFile(recordsNeeded, valuesPerRecord, fname);
       
    writefln("All done. Check if records written to %s", fname);
}

// creates a file containing structured, random data.
void CreateDataFile(const(int) recordsNeeded, const(int) valuesPerRecord, const(string) fname)
{
    auto file = File(fname, "w");
    scope(exit) file.close;
    
    Appender!string bigString = appender!string;
    bigString.reserve(recordsNeeded);
    
    const int iotaStartNum = 100_000_001;
    
    foreach(i, id; iota(iotaStartNum, iotaStartNum + recordsNeeded).enumerate)
    {       
        bigString
            ~= id.to!string
            ~ ","
            ~ valuesPerRecord.iota.map!(e => dice(0.6, 1.4)).format!"%(%s,%)" 
            ~ "\n";
    }
    
    file.write(bigString[]);  
}
