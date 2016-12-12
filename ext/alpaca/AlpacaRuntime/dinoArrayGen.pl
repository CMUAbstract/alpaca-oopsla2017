#!/usr/bin/perl

use warnings;
use strict;

my $name = $ARGV[0];
my $size = $ARGV[1];

for(0 .. $size){
   print "volatile __attribute__((section(\"FRAMVARS\"))) unsigned int ";
   print "".$name.$_.";\n";
}

print "unsigned __dino_read".$name."(unsigned i){\n";
print "  ";
for(0 .. $size){
  print "if( i == ".$_." ){\n    return ".$name.$_.";\n  }else ";
}
print "{ /*should never get here!*/ return 0; }\n}\n";

print "void __dino_write".$name."(unsigned i,unsigned v){\n";
print "  ";
for(0 .. $size){
  print "if( i == ".$_." ){\n    ".$name.$_." = v;\n  }else ";
}
print "{ /*should never get here!*/ return; }\n}\n";
