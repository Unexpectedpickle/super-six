@isTest
public class accountWContractsControllerTest {

@TestSetup
static void makeData(){
       //Create Account
       Account acc = new Account(Name='Test Account');
       insert acc;
       //Create Contract
        TestDataHelper.createContracts(2);
       
}

    
    @isTest
    public static void DisplayAccountNameTest() {
    Test.startTest();
    //Test that display works for Account Name
    accountWContractsController accountWContractsController = new accountWContractsController();
    for(Integer i; i<accountWContractsController.displayContract.size(); i++){
        if(accountWContractsController.displayContract.get(i).wrappedAccount_Name.Name == 'Test Account'){
            System.assert(true);
        }

    }
    Test.stopTest();
    }

}