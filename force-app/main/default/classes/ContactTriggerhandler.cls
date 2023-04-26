/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 04-26-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class ContactTriggerhandler {
   public static void updateContactCount(Set<Id> accIdList){
    if(!accIdList.isEmpty()){
        List<Account> accList = [SELECT Id, Number_of_Contacts__c,(SELECT Id FROM Contacts) From Account WHERE Id IN :accIdList];
        if(!accList.isEmpty()){
            for(Account acc: accList){
                acc.Number_of_Contacts__c = acc.Contacts.size();
            }
            Database.update(accList,true);
        }
    }  
   }
}