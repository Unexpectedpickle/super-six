public class SiteAssignmentHandler {
    public static void associateDefaultPerson(List<Site_Assignment__c> siteAssignments, String userId) {
        for (Site_Assignment__c sass : siteAssignments) {
            sass.Person__c = userId;
        }
    }
}