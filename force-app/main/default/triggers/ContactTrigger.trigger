/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 04-26-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
trigger ContactTrigger on Contact (after insert,after update,after delete,after undelete) {
    Set<Id> accIds = new Set<Id>();
    if(Trigger.isInsert){
        for(Contact con:Trigger.new){
            accIds.add(con.AccountId);
        }
        ContactTriggerhandler.updateContactCount(accIds);
    }
    else if(Trigger.isUpdate){
        for(Contact con:Trigger.new){
            if(Trigger.oldMap.get(con.Id).AccountId != con.AccountId){
                accIds.add(con.AccountId);
                accIds.add(Trigger.oldMap.get(con.Id).AccountId);
            }
        }
        ContactTriggerhandler.updateContactCount(accIds);
    }
    else if(Trigger.isDelete){
        for(Contact con:Trigger.old){
            accIds.add(con.AccountId);
        }
        ContactTriggerhandler.updateContactCount(accIds);
    }
    else if(Trigger.isUndelete){
        for(Contact con:Trigger.new){
            accIds.add(con.AccountId);
        }
        ContactTriggerhandler.updateContactCount(accIds);
    }
}