package source_sink.simulations;

import inet.physicallayer.ieee802154.packetlevel.Ieee802154NarrowbandScalarRadioMedium;
import source_sink.simulations.DSMEHost;

network SourceSink
{
    submodules:
        source: DSMEHost {
            parameters:
                @display("i=block/source;p=180,70");
                applicationType = "Source";

        }

        sink: DSMEHost {
            parameters:
                @display("i=block/sink;p=30,70");
                applicationType = "Sink";
        }

        radioMedium: Ieee802154NarrowbandScalarRadioMedium {
            @display("p=111,142");
        }
}
