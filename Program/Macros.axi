PROGRAM_NAME='Macros'

// System functions and macros
DEFINE_CONSTANT

	volatile long _TLID = 1

DEFINE_VARIABLE

	volatile long lTimes[1] = 500 // Update feedback every 1/2 sec

	volatile integer nBtnSystemOn  		  = 1
	volatile integer nBtnSystemOff 		  = 2
	volatile integer nBtnSystemOffConfirm = 3

DEFINE_START

	Timeline_Create(_TLID,lTimes,1,Timeline_Relative,Timeline_Repeat)

	define_function fnProjector(integer bOn)
	{
		fnDebug('SYS: Projector')
	}


	define_function fnSystemOn()
	{
		fnDebug('SYS: System ON')
	}
	
	define_function fnSystemOff()
	{
		fnDebug('SYS: System OFF')
	}

	define_function fnFeedback()
	{
		#warn 'inserte aqu� feedback si fuera necesario'
	}

DEFINE_EVENT

	button_event[dvTp,nBtnSystemOn]
	{
		push:
		{
			
		}
	}
	
	button_event[dvtp,nBtnSystemOff]
	{
		push:
		{
		
		}
	}
	
	button_event[dvTp,nBtnSystemOffConfirm]
	{
		push:
		{
			
		}
	}
	
	timeline_event[_TLID]
	{
		// Inserte algo que desee hacer de forma peri�dica...
		fnFeedback()
		
		#WARN '*** Active the simulated feedback if necesary'
		(* For example:
		#IF_DEFINED __PROGRAMMING__
			on[vdvProjector,_CT_CH_FB_SIMULADO]
		#END_IF
		*)
	}

(**********************************************************)
(******************** 	EARPRO 2019	 	********************)
(**********************************************************) 