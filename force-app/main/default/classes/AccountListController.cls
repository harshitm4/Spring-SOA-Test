/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 04-26-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class AccountListController {
    @AuraEnabled
    public static List<Account> getAccounts(){
        try {
            List<Account> accList = [SELECT Id,Name From Account ORDER BY CreatedDate DESC LIMIT 10];
            return accList;
        } catch (Exception e) {
            System.debug('Exception:-'+e.getMessage());
            return null;
        }
    }
}