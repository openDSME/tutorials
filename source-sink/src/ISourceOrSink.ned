package source_sink;

moduleinterface ISourceOrSink
{
    parameters:
        @display("i=block/app");
    gates:
        input in;
        output out;
}