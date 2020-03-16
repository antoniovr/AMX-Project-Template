PROGRAM_NAME='Macros'
(***********************************************************)
(*  FILE_LAST_MODIFIED_ON: 11/20/2019  AT: 11:48:13        *)
(***********************************************************)

#include 'SNAPI'
#include 'KeyValue'
#include 'wake-on-lan'

// System functions and macros
DEFINE_CONSTANT

    long _TLID = 1
    long lTimes[1] = {500} // Update feedback every 1/2 sec

DEFINE_VARIABLE

    volatile integer nBtnSystemOn = 1
    volatile integer nBtnSystemOff = 2
    volatile integer nBtnSystemOffConfirm = 3
    
    persistent _uKeys uKeys
    
    volatile integer _PAGE_LOGO = 1
    volatile integer _PAGE_MAIN = 2
    
    volatile char asPages[][32] = {'Logo',
				   'Main'}
				   
    volatile integer _POP_1 = 1
    volatile integer _POP_2 = 2
    
    volatile char asPopups[][32] = {'pop1',
				    'pop2'}
    
    volatile integer bSystemOn = false

DEFINE_START

    Timeline_Create(_TLID,lTimes,1,TIMELINE_RELATIVE,TIMELINE_REPEAT)

    define_function fnProjectorPower(integer bOn)
    {
	fnInfo("'fnProjectorPower(',itoa(bOn),')'")
	if(bOn)
	{
	    
	}
	else
	{
	    
	}
    }

    define_function fnDisplayPower(integer bOn)
    {
	fnInfo("'fnDisplayPower(',itoa(bOn),')'")
	if(bOn)
	{
	    
	}
	else
	{
	    
	}
    }

    define_function fnSystemOn()
    {
	if(!bSystemOn)
	{
	    fnInfo('fnSystemOn()')
	    bSystemOn = true
	}
    }

    define_function fnSystemOff()
    {
	if(bSystemOn)
	{
	    fnInfo('fnSystemOff()')
	    bSystemOn = false
	}
    }

    define_function fnFeedback()
    {
	#warn 'Macros: Add feedback if necessary'
    }
    
    define_function fnResetPanel()
    {
	#warn 'Macros: Write what the panel has to do when it reset or comes online for the first time'
	fnPopupCloseAll(dvTp)
	fnPageOpen(dvTp,asPages[_PAGE_LOGO])
    }

DEFINE_EVENT

    button_event[dvTp,nBtnSystemOn]
    {
	push:
	{
	    fnSystemOn()
	    fnPageOpen(dvTp,asPages[_PAGE_MAIN])
	}
    }

    button_event[dvtp,nBtnSystemOff]
    {
	push:
	{
	    fnSystemOff()
	    fnPopupCloseAll(dvTp)
	    fnPageOpen(dvTp,asPages[_PAGE_LOGO])
	}
    }

    channel_event[vdvSystem,0]
    {	
	on:
	{
	    switch(channel.channel)
	    {
		case 1: // Pair Key/Value usage example - Store
		{
		    fnInfo('keyAdd(IP,192.168.1.104)')
		    keyAdd(uKeys,'IP','192.168.1.104')		
		}
		case 2: // Pair Key/Value usage example - Recall
		{
		    char sIP[255]
		    keyGet(uKeys,'IP',sIP)
		    fnInfo("'sIP vale: ',sIP")		
		}
		case 3: // WOL example
		{
		    fnInfo("'WAKE ON LAN TEST'")
		    fnWakeOnLan("$00,$08,$9B,$F8,$7C,$F6")
		}
	    }
	}
    }
      
  
    data_event[dvTp]
    {
	online:
	{
	    fnResetPanel()
	}
    }

    timeline_event[_TLID]
    {
	// Insert something to run periodically
	fnFeedback()
    }

(***********************************************************)
(*		    	END OF PROGRAM			   *)
(***********************************************************) 