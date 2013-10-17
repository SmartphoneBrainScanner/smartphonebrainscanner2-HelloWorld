#include "mycallback.h"

MyCallback::MyCallback(QObject *parent) :
    Sbs2Callback(parent)
{
}

/**
  Reimplemented callback method. This method sees single packets and handles them.
  */
void MyCallback::getData(Sbs2Packet *packet)
{
    //set current packet, increment counters
    setPacket(packet);

    if (currentPacketCounter%8 == 0)
	emit timeTick8();

    emit valueSignal((QVariant)thisPacket->filteredValues["O2"]);
}
