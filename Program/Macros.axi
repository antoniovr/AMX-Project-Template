PROGRAM_NAME='Macros'
(***********************************************************)
(*  FILE_LAST_MODIFIED_ON: 07/19/2019  AT: 12:17:41        *)
(***********************************************************)

#include 'KeyValue'

// System functions and macros
DEFINE_CONSTANT

    long _TLID = 1
    long lTimes[1] = {500} // Update feedback every 1/2 sec

DEFINE_VARIABLE

    volatile integer nBtnSystemOn = 1
    volatile integer nBtnSystemOff = 2
    volatile integer nBtnSystemOffConfirm = 3
    
    persistent _uKeys uKeys

DEFINE_START

    Timeline_Create(_TLID,lTimes,1,Timeline_Relative,Timeline_Repeat)

    define_function fnProjector(integer bOn)
    {
	fnInfo('Proyector')
    }

    define_function fnSystemOn()
    {
	fnInfo('fnSystemOn()')
    }

    define_function fnSystemOff()
    {
	fnInfo('fnSystemOff()')
	amx_log(AMX_INFO,"'fnSystemOff2()'")
    }

    define_function fnFeedback()
    {
	#warn 'SYS: Add feedback if necessary'
    }

DEFINE_EVENT

    button_event[dvTp,nBtnSystemOn]
    {
	push:
	{
	    fnSystemOn()
	}
    }

    button_event[dvtp,nBtnSystemOff]
    {
	push:
	{
	    fnSystemOff()
	}
    }

    button_event[dvTp,nBtnSystemOffConfirm]
    {
	push:
	{
	    fnSystemOff()
	}
    }

    channel_event[vdvSystem,1]
    {	
	on:
	{
	    fnInfo('keyAdd(IP,192.168.1.104)')
	    keyAdd(uKeys,'IP','192.168.1.104')
	}
    }
    
    channel_event[vdvSystem,2]
    {
	on:
	{
	    char sIP[255]
	    keyGet(uKeys,'IP',sIP)
	    fnInfo("'sIP vale: ',sIP")
	}
    }

    timeline_event[_TLID]
    {
	// Insert something to run periodically
	fnFeedback()
	
	#WARN '*** Active the simulated feedback if necesary'
	(* For example:
	#IF_DEFINED _PROGRAMMING
	on[vdvProjector,SIMULATED_FB]
	#END_IF
	*)
    }

(***********************************************************)
(*		    	EARPRO 2019   			   *)
(***********************************************************) 