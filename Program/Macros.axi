PROGRAM_NAME='Macros'
(***********************************************************)
(*  FILE_LAST_MODIFIED_ON: 10/03/2020  AT: 12:59:53        *)
(***********************************************************)

#include 'SNAPI'
#include 'CUSTOMAPI'
//#include 'KeyValue'
//#include 'wake-on-lan'

// System functions and macros
DEFINE_CONSTANT

    long _TLID = 1
    long lTimes[1] = {500} // Update feedback every 1/2 sec

DEFINE_VARIABLE
	
	// Storing key value pairs if needed
    //persistent _uKeys uKeys
	
	// Navigation constants
    volatile integer _PAGE_LOGO = 1
    volatile integer _PAGE_MAIN = 2

	volatile char asPages[][32] = {'Logo',
								   'Main'}
				   
    volatile integer _POP_1 = 1
    volatile integer _POP_2 = 2
    
    volatile char asPopups[][32] = {'pop1',
									'pop2'}
	
	// Channel and Address codes
    volatile integer nBtnSystemOn = 1
    volatile integer nBtnSystemOff = 2

	volatile integer anBtnMenu[] = {
									10, // Title
									11, // Title
									12  // Title
								}

	// Others
	volatile integer bSystemOn = false								

DEFINE_START

	get_buffer_string(string,length)
	timeline_create(_TLID,lTimes,1,TIMELINE_RELATIVE,TIMELINE_REPEAT)

    define_function fnSwitch(dev vdvSwitcher,integer nLevel, integer nIn,integer nOut)
    {	
		switch(nLevel)
		{
			case _LEVEL_ALL:
			{
				fnInfo("'fnSwitch(ALL,',itoa(nIn),',',itoa(nOut),')'")
				send_command vdvSwitcher,"'CI',itoa(nIn),'O',itoa(nOut)"   
			}
			case _LEVEL_VIDEO:
			{
				fnInfo("'fnSwitch(VIDEO,',itoa(nIn),',',itoa(nOut),')'")
				send_command vdvSwitcher,"'VI',itoa(nIn),'O',itoa(nOut)"   		
			}
			case _LEVEL_AUDIO:
			{
				fnInfo("'fnSwitch(AUDIO,',itoa(nIn),',',itoa(nOut),')'")
				send_command vdvSwitcher,"'AI',itoa(nIn),'O',itoa(nOut)"   
			}
		}
    }

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
		fnInfo('fnResetPanel()')
		#warn 'Macros: Write what the panel has to do when it reset or comes online for the first time'
		fnPopupCloseAll(dvTp)
		fnPageOpen(dvTp,asPages[_PAGE_LOGO])
    }

DEFINE_EVENT

	button_event[dvTp,anBtnMenu]
	{
		push:
		{
			stack_var integer nPush
			nPush = get_last(anBtnMenu)
			switch(nPush)
			{
				case 1: // Menu 1
				{
					
				}
				case 2: // Menu 2
				{
					
				}
			}
		}
	}

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

	/*
	This channel event is for test purposes
	*/
    channel_event[vdvSystem,0]
    {	
		on:
		{
			switch(channel.channel)
			{
				case 1: // Pair Key/Value usage example - Store
				{
					/*
					fnInfo('keyAdd(IP,192.168.1.104)')
					keyAdd(uKeys,'IP','192.168.1.104')		
					*/
				}
				case 2: // Pair Key/Value usage example - Recall
				{
					/*
					char sIP[255]
					keyGet(uKeys,'IP',sIP)
					fnInfo("'sIP vale: ',sIP")		
					*/
				}
				case 3: // WOL example
				{
					/*
					fnInfo("'WAKE ON LAN TEST'")
					fnWakeOnLan("$00,$08,$9B,$F8,$7C,$F6")
					*/
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

(********************************************)
(*				END OF PROGRAM				*)
(********************************************) 