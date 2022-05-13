public class accountWContractsController {
    //Get Contracts associated with an Account
    //	Query for Contracts associated with an Account
    //	Create Wrapper
    public List<Account> accounts = new List<Account>();
    public List<contractWrapper> wrappedContract {get;set;}
    public List<contractWrapper> filteredContract {get;set;}
    public List<contractWrapper> displayContract {get;set;}

    public string filter {get;set;}
    private class contractWrapper{
        public Integer wrappedCountContract_Id{get;set;}
        public Account wrappedAccount_Name{get;set;}
        //public List<contractWrapper> wrappedcontract = new List<contractWrapper>();
        public contractWrapper(Integer contract_Id, Account account_Name) {
        wrappedCountContract_Id = contract_Id;
        wrappedAccount_Name = account_Name;
    }
    }

    public accountWContractsController() {
        List<aggregateResult> contractswAccName = new List<aggregateResult>([SELECT AccountId, COUNT(ID) FROM Contract Group By AccountId]);
        List<Account> accounts = [SELECT name, ID FROM account];
        wrappedContract = new List<contractWrapper>();
        displayContract = new List<contractWrapper>();
        for (aggregateResult ar: contractsWAccName){
            Account accountstr = new Account();
            Integer cnt = Integer.valueOf(ar.get('expr0'));
            accountstr = getaccount(ar,accounts);
            System.debug(cnt);
            System.debug(accountstr);
            wrappedContract.add(new contractWrapper(cnt,accountstr));
            } displayContract = wrappedContract;
        }
    public Account getaccount(aggregateResult ar,List<account> accounts){
        Account returnedAccount = new Account();
        returnedAccount.name = 'none';
        for(Account acc : accounts){
            String stringacc = String.valueOf(acc.Id);
            if(ar.get('accountId') == stringacc){
                returnedAccount = acc;
            }
        }
        return returnedAccount;
    }
        public void filterWrap(){
            if (String.isBlank(filter)){
                displayContract = wrappedContract;
                return;
            }
         List<contractWrapper> filteredContract = new List<contractWrapper>();
             for(contractWrapper wrappedContracts : wrappedContract){
                 if(wrappedcontracts.wrappedAccount_Name.Name.contains(filter)){
                     filteredContract.add(wrappedContracts);
                 }
             }
    displayContract = filteredContract; } 
}