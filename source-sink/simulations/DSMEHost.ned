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
                macType   = "DSME";
                radioType = "Ieee802154NarrowbandScalarRadio";
        }

    connections allowunconnected:
        application.out --> wlan.upperLayerIn;
        application.in <-- wlan.upperLayerOut;
}
