@isTest
public class accountWContractsControllerTest {
@TestSetup
static void makeData(){
       //Create Account
       Account acc = new Account(Name='Test Account');
       insert acc;
       //Create Contract
        TestDataHelper.createContracts(2);
   
       //Associate Account Id with Contract CustomerSigned Id
       acc.Id = contractList.CustomerSignedId;
}

    
    @isTest
    public static void TPaccountWContractsControllerTest() {
    Test.startTest();
    //Test that Filter works
    accountWithContractsController accountWContractsController = new accountWContractsController();
    Test.stopTest();
    System.assert(accountWContractsController.displayContract, 'Test Account', 1);

    }
}

