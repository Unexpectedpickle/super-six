public class contracthandler {
    public static void preventContractCreation() {
        /*prevent the creation of contract if no contact is selected or if contact has no phone number or Email.
        get set of contracts
        if no contact is selected prevent creation
        if contact is selected but has no phone number or no Email prevent creation
        */
        Set<Contract> Contracts = new Set<Contract>([SELECT ID, (SELECT LastName, Phone, Email FROM Contact)FROM Contract]);
         for (contract currContract : Contracts){
             if (Contract.contact.LastName == null){
                 currContract.addError('Error: Cannot create a contract without selecting a contact');
             }
             if (Contract.contact.Phone == null && Contract.contact.Email == null){
                 currContract.addError('Error: Cannot create a contract if the contact does not have a phone number or Email');
             }
         } 

    }
}
