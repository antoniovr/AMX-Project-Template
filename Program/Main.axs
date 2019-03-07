PROGRAM_NAME='Main'

(******************************************)
(* Project:                              	*)
(* Author:                                *)
(* Date:                                 	*)
(* Info: Rev. History in Readme file  		*)
(******************************************)

(********************************)
(**  Project Template v.3.9    **)
(**   by: avargas@avit.vision  **)
(********************************)

//#DEFINE __PROGRAMMING__

DEFINE_DEVICE

	// Touch panels and keypads
	dvTp = 10001:1:0

	// System
	vdvSystem = 33000:1:0

	// RS-232/484 Devices
	dvProjector = 5001:1:0
	vdvProjector = 33002:1:0

	// AXLink devices

	// IR devices (NX Standard)
	dvIR1 = 5001:11:0     
	
	// Relays (NX Standard)
	dvRelay = 5001:21:0   

	// IOs (NX Standard)
	dvIO  = 5001:22:0     
	
// Libraries
#include 'SNAPI.axi'
#include 'EarAPI.axi'
#include 'Modules.axi'
#include 'Macros.axi'

DEFINE_EVENT

// With this two lines we avoid unhandled events causing the master to run DEFINE_PROGRAM more than necessary
button_event[dvTp,0] {Push:{} Release:{}}
channel_event[dvTp,0] {On:{} Off:{}}
/*
There are four conditions that cause the NetLinx master to run DEFINE_PROGRAM:
1) An unhandled event occurs 
2) A variable is written to* (this is the CPU usage culprit) 
3) The ‘run occasionally anyway’ timer fires (~1/second) 
4) The event queue has become empty
*/

(**********************************************************)
(******************** 	EARPRO 2019	 	********************)
(**********************************************************) 