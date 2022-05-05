/*Created by: Kyle Stetz
 *Last Updated: 5/4/2022
 *Description: Handler for Contract Trigger
*/
public with sharing class ContractContactHandler {
    /*
    *when job ready to start gets checked.
    *do we know if the check box is checked? yes in trigger.new Foreman_Start_Job__c == true
    *check the contact for an email
    *do we have the contact for the contract? yes in trigger.new CustomerSignedId
    *does CustomerSignedId have an email? not sure query to find out
    *what is the relationship with CostomerSingedId and Contact? lookup to contact parent is contact and child is contract
    *set of contactID [SELECT id FROM contact where contact.contracts.CustomerSingedID]
    *if no email then  
    *Set a Default Email 
    *send a email
    */
    
    public static void ContractEmail(List<Contract> jobStart){
        List<contact> toUpdate = new List<Contact> ();
        /*Set<Id> contactId = new Set<Id>([SELECT id FROM Contact WHERE id IN (SELECT customerSignedID FROM Contract)]);*/
        List<Contact> contactId = new List<Contact>([SELECT email FROM Contact WHERE id IN (SELECT customerSignedID FROM Contract)]);
        String defaultEmail ='you@example.com' ;
        for(Contract job : jobStart){
            if (job.Foreman_Start_Job__c == true) {
                for (Contact con : contactId){
                    if (contactEmail(con) == false) {
                        con.Email = defaultEmail;
                        toUpdate.add(con);
                    }
                }
                sendEmailForeman();
            }
        }
        Update toUpdate;
    }
    private static Boolean contactEmail(Contact hasEmail){

        if(hasEmail.Email == null || hasEmail.Email == ''){
            return false;
        }
        else {
            return true;
        }
    }
    private static void sendEmailForeman(){
        String emailBody = 'A default email was give to the Contract please contact them and update their email adress';
        List<Messaging.SingleEmailMessage> foremanEmails = new List<Messaging.SingleEmailMessage>();
       /* String sendTo = [SELECT email FROM user  WHERE isactive = true and Profile.name LIKE 'Construction Foreman' LIMIT 1];*/
        List<String> sendTo = new List<String>();
        sendTo.add('kstetz3@live.com');
        Messaging.SingleEmailMessage foremanEmail = new Messaging.SingleEmailMessage();
        foremanEmail.setToAddresses(sendTo);
        foremanEmail.setSubject('Contact Email'); 
        foremanEmail.setHtmlBody(emailBody);
        foremanEmails.add(foremanEmail);   
        Messaging.sendEmail(foremanEmails);

    }
}