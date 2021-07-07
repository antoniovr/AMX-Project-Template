PROGRAM_NAME='Modules'
(***********************************************************)
(*  FILE_LAST_MODIFIED_ON: 03/24/2021  AT: 08:59:53        *)
(***********************************************************)

// Comm and UI module definitions

/*
    IMPORTANT NOTE
    For the UIs we highly recommend the use of panel ports 
    for each device and the use of G4API.axi library on 
    each to always use the same channel numbers. Thank you.

*/

#include 'CUSTOMAPI'

DEFINE_VARIABLE


DEFINE_MODULE

    /*
    'Type_Manfacturer_Model_COMM' test_COMM(vdvEth,
                                            dvEth)
    */

DEFINE_EVENT

    /*
    data_event[vdvEth]
    {
        online:
        {
            #IF_DEFINED _PROGRAMMING
            on[data.device,SIMULATED_FB]
            fnModuleSetDebug(data.device,4)
            #ELSE
            fnModuleSetDebug(data.device,1)
            #END_IF
            fnModuleSetIP(data.device,'192.168.1.100')
            fnModuleSetPort(data.device,23)
            fnModuleReinit(data.device)
        }
    }
    */


(********************************************)
(*             END OF PROGRAM               *)
(********************************************) 