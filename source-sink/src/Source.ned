package source_sink;

import source_sink.ISourceOrSink;

module Source like ISourceOrSink
{
    parameters:
        @class(::source_sink::Source);
        volatile double sendInterval @unit(s) = default(exponential(1s));
    gates:
        input in;
        output out;
}
