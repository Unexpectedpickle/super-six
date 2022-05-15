@isTest
public class TestContractsTableController {
    
    private static final Date DEFAULT_DATE = Date.newInstance(2022, 5, 14);

    @TestSetup
    static void makeData(){
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
    public static void TestPositiveContractList(){
        Test.startTest();

        ContractsTableController controller = new ContractsTableController();
        System.assert(!controller.wrappedContracts.isEmpty(), 'Retrieved list of Contracts with the Related Contacts');


        Test.stopTest();
    }

}