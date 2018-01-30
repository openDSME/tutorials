package multihop.simulations;

import inet.physicallayer.ieee802154.packetlevel.Ieee802154NarrowbandScalarRadioMedium;
import inet_dsme.simulations.IEEE802154ExampleHost;

network Multihop
{
    submodules:
        host[5]: IEEE802154ExampleHost {
            parameters:
                @display("p=100,200;is=vs");
        }

        radioMedium: Ieee802154NarrowbandScalarRadioMedium {
            @display("p=100,50");
        }
}
