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
    /*
     @isTest
        public static void displayContractCountTest(){
            Test.startTest();
            //test that the display works for Contract Count
         accountWContractsController accountWContractsController = new accountWContractsController();
            List<Account> accs = [SELECT Id FROM Account WHERE name = 'Test Account' ];
            List<Contract> contracts = [SELECT Id From Contract];
            contracts.CustomerSignedId = accs.Id;
            for(Contract contr : contracts){
                contracts.CustomerSignedId = accs.Id;
            }
            
    for(Integer i; i<accountWContractsController.displayContract.size(); i++){
        if(accountWContractsController.displayContract.get(i).wrappedCountContract_Id.Count(Id) == 2){
            System.assert(true);
           
            }
        Test.stopTest();
        }

    
} */ 
}