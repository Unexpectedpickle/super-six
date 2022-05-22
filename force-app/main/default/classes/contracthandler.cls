public class contracthandler {

     public static void preventContractCreation(List<Contract> Contracts) {
        /*prevent the creation of contract if no contact is selected or if contact has no phone number or Email.
        get set of contracts
        if no contact is selected prevent creation
        if contact is selected but has no phone number or no Email prevent creation
        */

        Set<Contact> Contacts = new Set<Contact>([SELECT ID, Phone, Email FROM Contact]);
        for (Contract contr : Contracts){
            for (Contact con : Contacts){
                if(contr.CustomerSignedId == con.Id){
                    if(con.Phone== null && con.Email == null){
                        contr.addError('Error: Cannot create Contract if Contact does not have an Email and a phone number');
                    }
                }
               

            }
        }
}
}