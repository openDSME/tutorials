//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
// 

#include "Source.h"

#include "inet/common/packet/Packet.h"
#include "inet/common/packet/chunk/ByteCountChunk.h"
#include "inet/linklayer/common/MacAddressTag_m.h"

namespace source_sink {

Define_Module(Source);

Source::Source()
{
    timerMessage = NULL;
}

Source::~Source()
{
    cancelAndDelete(timerMessage);
}

void Source::initialize()
{
    timerMessage = new cMessage("timer");
    scheduleAt(simTime(), timerMessage);
}

void Source::handleMessage(cMessage *msg)
{
    ASSERT(msg==timerMessage);

    auto packet = new inet::Packet("sample");

    packet->addTagIfAbsent<inet::MacAddressReq>()->setDestAddress(inet::MacAddress("000000000000"));
    packet->insertAtBeginning(inet::makeShared<inet::ByteCountChunk>(inet::B(20)));

    send(packet, "out");

    scheduleAt(simTime()+par("sendInterval").doubleValue(), timerMessage);
}

}; // namespace
