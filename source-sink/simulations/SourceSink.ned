package source_sink.simulations;

import inet.physicallayer.ieee802154.packetlevel.Ieee802154NarrowbandScalarRadioMedium;
import source_sink.simulations.DSMEHost;

network SourceSink
{
    @display("bgb=300,100");
    submodules:
        source: DSMEHost {
            parameters:
                @display("is=vs;i=block/source;p=170,50");
                applicationType = "Source";
        }

        sink: DSMEHost {
            parameters:
                @display("is=vs;i=block/sink;p=25,50");
                applicationType = "Sink";
        }

        radioMedium: Ieee802154NarrowbandScalarRadioMedium {
            @display("p=250,20");
        }
}
