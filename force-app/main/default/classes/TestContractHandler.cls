/*
Created by:Kyle Stetz
Last updated on: 5/14/22
Description: Test Class for ContractContactHandler
*/
@isTest
public class TestContractHandler {
    private static final String DEFAULT_Email = 'you@example.com';
    private static final Date DEFAULT_DATE = Date.newInstance(2022, 5, 14);
    

    @TestSetup
    public static void makeData(){
        Account testAccount = new Account();
        testAccount.Name = 'TestAcc';
        Insert testAccount;
        Contact con = new Contact();
        con.LastName = 'Test';
        con.Phone = '123456789';
        Insert con;
        Contract Contracts = new Contract();
        Contracts.AccountId = testAccount.Id;
        Contracts.CustomerSignedId = con.Id;
        Contracts.StartDate = DEFAULT_DATE;
        Contracts.ContractTerm = 1;
        Contracts.Foreman_Start_Job__c = true;
        Insert Contracts;
    }


    @isTest
    public static void TestPositiveContractEmail (){
        Test.startTest();
        
        List<Contract> testContract = new List<Contract>();
        testContract.add([SELECT id, customerSignedId,Foreman_Start_Job__c FROM Contract]);
        List<Contact> con = new List<Contact>([SELECT email FROM Contact WHERE id IN (SELECT customerSignedID FROM Contract)]);
        for (Contract tract : testContract) {
            for (Contact tact : con) {
                if(tract.CustomerSignedId == tact.Id){
                    ContractContactHandler.ContractEmail(testContract);
                    System.assertEquals(DEFAULT_Email, tact.Email);
                }
                
            } 
        }
        
        

        Test.stopTest();
    }
}