[header]
NAMESPACE = NET.BASE_PROTO
NAME = FT_CONSTRAINTS_4
QUALIFIER = {}[_eventno >= 4]

[states]
ip_pkt_sd = {sipaddr = $1, dipaddr = $2, protocol=$3}
ip_pkt_ds = {sipaddr = $ip_pkt_sd.dipaddr , 
             dipaddr = $ip_pkt_sd.sipaddr, 
             protocol=$ip_pkt_sd.protocol}

[behavior]
# INIT is prepended to all behaviors by default
b = (ip_pkt_sd ~>[<1s] ip_pkt_ds)

[model]
IP_PKTPAIR(eventno, eventtype, timestamp, timestampusec, sipaddr, dipaddr, protocol, sport) = b 