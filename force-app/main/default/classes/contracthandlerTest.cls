@isTest
public class contracthandlerTest {
    
        @TestSetup
    static void createTestData(){   
    }
    @isTest
     public static void testPreventContractCreation() {
      Test.startTest();
        /*
        create flawed contracts and prevent them from being added to List
        1. Contract where contact does not have a phone number and does not have a Email
        */
        List<Contract> allContracts = new List<Contract>();
        List<Contract> flawedContracts = new List<Contract>();
        contract contract_To_Insert = new contract();
        contact flawedContact = new Contact(FirstName = 'Test', LastName = 'Contact', Phone = null, Email = null);
        //link flawedContact to Contract_To_Insert
        flawedContact.id = contract_To_Insert.CustomerSignedId;
        Integer numContractsBefore = [SELECT COUNT() FROM Contract];

        
        
        Insert flawedContact;
        flawedContracts.add(contract_To_Insert);
        contracthandler.preventContractCreation(flawedContracts);
        Integer numContractsAfter = [SELECT COUNT() FROM Contract];
        System.assertEquals(numContractsBefore, numContractsAfter);
        System.debug(numContractsBefore);
        System.debug(numCOntractsAfter);
        Test.stopTest();
        }
    @isTest
     
    public static void test_BulkPreventContractCreation(){
        Test.startTest();
        List<Contract> allContracts = new List<Contract>();
        List<Contract> flawedContracts = new List<Contract>();
        contract contract_To_Insert = new contract();
       Integer numContractsBefore = [SELECT COUNT() FROM Contract];
       for(Integer i; i<151; i++){
                   contact flawedContact = new Contact(FirstName = 'Test', LastName = 'Contact '+i, Phone = null, Email = null);
                   flawedContact.id = contract_To_Insert.CustomerSignedId;
        		   Insert flawedContact;
                   flawedContracts.add(contract_To_Insert);
        Test.stopTest();
       }
       contracthandler.preventContractCreation(flawedContracts);
       Integer numContractsAfter = [SELECT COUNT() FROM Contract];
       
       System.assertEquals(numContractsBefore, numContractsAfter);
       System.debug(numContractsBefore);
       System.debug(numContractsAfter);

    }
}