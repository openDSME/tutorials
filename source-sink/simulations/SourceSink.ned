package source_sink.simulations;

import inet.physicallayer.ieee802154.packetlevel.Ieee802154NarrowbandScalarRadioMedium;
import source_sink.simulations.DSMEHost;

network SourceSink
{
    @display("bgb=294,94");
    submodules:
        source: DSMEHost {
            parameters:
                @display("i=block/source;p=167,50");
                applicationType = "Source";
        }

        sink: DSMEHost {
            parameters:
                @display("i=block/sink;p=25,50");
                applicationType = "Sink";
        }

        radioMedium: Ieee802154NarrowbandScalarRadioMedium {
            @display("p=242,21");
        }
}
