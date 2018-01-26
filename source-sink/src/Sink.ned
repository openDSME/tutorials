package source_sink;

module Sink like ISourceOrSink
{
    parameters:
        @class(::source_sink::Sink);
    gates:
        input in;
        output out;
}
