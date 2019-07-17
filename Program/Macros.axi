PROGRAM_NAME='Macros'
(***********************************************************)
(*  FILE_LAST_MODIFIED_ON: 07/16/2019  AT: 13:59:55        *)
(***********************************************************)

// System functions and macros
DEFINE_CONSTANT

    volatile long _TLID = 1

DEFINE_VARIABLE

    volatile long lTimes[1] = 500 // Update feedback every 1/2 sec

    volatile integer nBtnSystemOn = 1
    volatile integer nBtnSystemOff = 2
    volatile integer nBtnSystemOffConfirm = 3

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