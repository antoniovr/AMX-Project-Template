PROGRAM_NAME='Main'
(***********************************************************)
(*  FILE_LAST_MODIFIED_ON: 12/01/2020  AT: 13:18:40        *)
(***********************************************************)

    /*
    Project:                              	
    Author: Antonio Vargas                              
    Date:                                 	
    Rev: 1.0.YY.MMDD
    Notes: Aditional info on Readme.txt 		
    */

    /*
    Project Template v.2.0
    */

#warn 'Main: Comment this in the installation'
#DEFINE _PROGRAMMING

DEFINE_DEVICE

    // Touch panels and keypads
    dvTp = 10001:1:0

    // System
    vdvSystem = 33000:1:0

    // Ethernet Devices
    dvEth = 0:4:0
    vdvEth = 33001:1:0

    // RS-232/485 Devices
    dv232 = 5001:1:0
    vdv232 = 33002:1:0

    // AXLink devices

    // IR devices (NX Standard)
    dvIR1 = 5001:11:0     
    
    // Relays (NX Standard)
    dvRelay = 5001:21:0   

    // IOs (NX Standard)
    dvIO  = 5001:22:0   

    // Libraries
    #include 'SNAPI'
    #include 'CUSTOMAPI'
    #include 'Modules'
    #warn 'Main: Comment the Macros call if you are using TP_Module (for more than 1 touch panel solution)'
    #include 'Macros'
    //#include 'wake-on-lan'

DEFINE_START

    //#warn 'Main: set log level'
    //set_log_level(AMX_ERROR)   // 2
    //set_log_level(AMX_WARNING) // 2
    #IF_DEFINED _PROGRAMMING
        set_log_level(AMX_DEBUG)   // 4    
    #ELSE
        set_log_level(AMX_INFO)    // 3 
    #END_IF

DEFINE_EVENT

    // With this two lines we avoid unhandled events causing the master to run DEFINE_PROGRAM more than necessary
    button_event[dvTp,0] {Push:{} Release:{}}
    channel_event[dvTp,0] {On:{} Off:{}}
    /*
    There are four conditions that cause the NetLinx master to run DEFINE_PROGRAM:
    1) An unhandled event occurs 
    2) A variable is written to* (this is the CPU usage culprit) 
    3) The 'run occasionally anyway' timer fires (~1/second) 
    4) The event queue has become empty
    */

(********************************************)
(*				END OF PROGRAM				*)
(********************************************) 