import std.stdio;

auto shit = [ "\x1b[31m", "\x1b[32m", "\x1b[33m", "\x1b[34m", "\x1b[35m", "\x1b[36m", "\x1b[0m"];

void main(string[] args){
    auto newargs = args;
    if ( newargs.length > 1 ) {
	foreach( filename ; args[1..$]){
	    auto file = File(filename, "r");
	    auto counter = 0;
	    foreach( line; file.byLine ) {
		write(shit[counter] );
		writeln(line);
		counter++;
		counter %= shit.length;
	    }
	}
    }else{
	auto counter = 0;
	while ( !stdin.eof ) {
	    auto line = readln();
	    write(shit[counter] );
	    write(line);
	    counter++;
	    counter %= shit.length;
	}
    }
    write(shit[$-1]);
}
