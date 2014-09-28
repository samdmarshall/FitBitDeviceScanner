/*
control packet: 0xC0

type:
"FBAirlinkOpcodePollHost"
"FBAirlinkOpcodeResetLink" = 0x01
"FBAirlinkOpcodeAck" = 0x02
"FBAirlinkOpcodeNak" = 0x03
"FBAirlinkOpcodeDisconnect" = 0x04
"FBAirlinkOpcodeAlertUser" = 0x05
"FBAirlinkOpcodeSetBondMode" = 0x06

Dump = 0x10 -> (0x03 mini) (0x0D mega) 

"FBAirlinkOpcodeUserActivity" = 0x12
"FBAirlinkOpcodeEcho" = 0x13
"FBAirlinkOpcodeInitAirlink" = 0x14

"FBAirlinkOpcodeObsoleteRxAck"
"FBAirlinkOpcodeReadTrackerBlock"
"FBAirlinkOpcodeReadTrackerMemory"
"FBAirlinkOpcodeReadFirstHostBlock"
"FBAirlinkOpcodeReadNextHostBlock"
"FBAirlinkOpcodeReadAirlinkBlock"
"FBAirlinkOpcodeUpdateTrackerBlock"

"FBAirlinkOpcodeXFR2HOSTSingleBlockResponse" = 0x40
"FBAirlinkOpcodeXFR2HOSTStreamStarting" = 0x41
"FBAirlinkOpcodeXFR2HOSTStreamFinished" = 0x42

"FBAirlinkOpcodeClientAuthStart" = 0x50
"FBAirlinkOpcodeClientAuthChallenge" = 0x51
"FBAirlinkOpcodeClientAuthChallengeResponse" = 0x52


total packet length ???

[header]
[C0 01]

[header]
[C0 02]

[header] [?? ??]
[C0 03] [XX XX]

[header]
[C0 04]

[header]
[C0 05]

[header]
[C0 06]


[header] [dump type]
[C0 10] [XX]


[header]
[C0 12]

[header]
[C0 13]

[header] [total length] [airlink major] [airlink minor] [MAC address]
[C0 14] [0C] [XX] [XX] [XX XX XX XX XX XX]


[header]
[C0 40]

[header] [total length]
[C0 41] [03]

[header] [??] [?? ??] [data length]
[C0 42] [03] [XX XX] [XX XX XX XX]


[header] [random] [nonce]
[C0 50] [XX XX XX XX] [XX XX XX XX] 

[header] [autg challenge] [challenge number]
[C0 51] [XX XX XX XX XX XX XX XX] [XX XX XX XX]

[header]
[C0 52] 


*/