/*
    Created by: Daven Horne, Grant Welton
    Description: Trigger for Contract sObject
    Date Created: 6 May, 2022
    Last Update: 6 May, 2022
*/

trigger ContractTrigger on Contract (before insert, before update, after insert) {
 switch on Trigger.operationType {
     when BEFORE_INSERT {
        SiteAreaConversionHandler.convertArea(Trigger.new);
     }
     when BEFORE_UPDATE {
        SiteAreaConversionHandler.convertArea(Trigger.new);
     }
     when AFTER_INSERT {
         
     }
 }
}   