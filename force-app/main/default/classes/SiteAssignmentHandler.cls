public class SiteAssignmentHandler {
    public static void associateDefaultPerson(List<Site_Assignment__c> siteAssignments, String userId) {
        for (Site_Assignment__c sass : siteAssignments) {
            if (sass.Person__c == null || sass.Person__c == '')
                sass.Person__c = userId;
        }
    }
}