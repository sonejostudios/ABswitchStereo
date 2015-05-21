declare name        "AB-Switch";
declare version     "1.0";
declare author      "Vincent Rateau";
declare license     "GPL";
declare copyright   "Vincent Rateau";
declare reference "http://www.sonejo.net/node/71";


process =  hgroup("[1]",volumes) : hgroup("[2]", switch) :> hgroup("[3]", swapLR : mono);

//process without GUI:
//process =  volumes : switch :> swapLR : mono;


//AB-Switch
ab = checkbox("A-B Switch");
switch = (ab-1) * _, (ab-1) * _ , ab * _, ab * _  ;


//Volume A and B
volumeA = vslider("Volume A", 1, 0, 1, 0.01);
volumeB = vslider("Volume B", 1, 0, 1, 0.01);
volumes = volumeA * _, volumeA * _, volumeB * _, volumeB * _;


//SwapLR
sb = checkbox("Swap L <-> R");
swapLR(a,b) = sb* a, sb* b, (sb-1) * b, (sb-1) * a :> _,_;


//Mono-Stereo switch
ms = checkbox("Mono");
mono(a,b) = (ms-1) * a, (ms-1) * b, (ms* a, ms* b :> _ * 0.5 <: _,_) :> _,_ ;





