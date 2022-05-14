public class ContractsTableController {
    public List<Wrap> wrappedContracts{get;set;}
    public class Wrap {
    	public Contract wrappedContract {get; set;}
    	public Contact wrappedContact {get; set;}
    	public Wrap(Contract wContract, Contact wContact){
        	wrappedContract = wContract;
        	wrappedContact = wContact;
    	}
} 
    public ContractsTableController(){
        List<Contract> CCTract = new List<Contract>([SELECT ID, customerSignedId, ContractNumber, Square_Feet__c, Estimated_Cost__c, Status FROM contract]);
   		List<Contact> Contacts = new List<Contact>([SELECT ID, Name, Phone, Email FROM contact Where ID IN (SELECT customerSignedId FROM Contract)]);
        wrappedContracts = new List<Wrap>();
        for (Contract c : CCTract){
            Contact cons = getContact(c, Contacts);
            wrappedContracts.add(new Wrap(c,cons));
        }
    }
    private static Contact getContact(Contract ctract, List<Contact> ctact){
        Contact newContact = new Contact();
        for(Contact con : ctact){
            if(con.Id == ctract.customerSignedId){
                newContact = con;
                return newContact;
            }
        }
        return newContact;
    }
}