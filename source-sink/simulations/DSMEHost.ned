package source_sink.simulations;

import inet.networklayer.common.InterfaceTable;
import inet.node.base.NodeBase;
import inet.linklayer.common.WirelessInterface;

import inet_dsme.DSME;

import source_sink.ISourceOrSink;

module DSMEHost extends NodeBase
{
    parameters:
        string applicationType;

        mobilityType = "StationaryMobility";
        *.interfaceTableModule = default(absPath(".interfaceTable"));

    submodules:
        application: <applicationType> like ISourceOrSink;
        interfaceTable: InterfaceTable;
        wlan: WirelessInterface {
            parameters:
                macType = "DSME";
                radioType = "Ieee802154NarrowbandScalarRadio";
                @display("p=586.92,299.088");
        }

    connections allowunconnected:
        application.out --> wlan.upperLayerIn;
        application.in <-- wlan.upperLayerOut;
}
