trigger ContractTrigger on Contract (before insert, before update, after insert ) {
 switch on Trigger.operationType {
     when BEFORE_INSERT {
       
       contracthandler.preventContractCreation(trigger.new);
     }
     when BEFORE_UPDATE {

     }
     when AFTER_INSERT {
         
     }
 }
 
}   