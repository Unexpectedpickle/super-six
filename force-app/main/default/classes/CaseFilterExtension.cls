public with sharing class CaseFilterExtension {
    public String filter {get; set;}
    public List<Case> filteredCases {get; set;}
    public List<Case> cases {get; set;}
    public List<Case> displayedCases {get; set;}

    public CaseFilterExtension(ApexPages.StandardSetController controller) {
        cases = [SELECT Account.name, Contact.name, Priority, Reason, Type FROM Case];
        controller = new ApexPages.StandardSetController(cases);
        displayedCases = cases;
    }

    public void filteredList() {
        filteredCases = new List<Case>();
        for(Case ca : cases) {
            if(ca.Priority.Contains(filter)) {
                filteredCases.add(ca);
            }
        }
        displayedCases = filteredCases;
    }
}