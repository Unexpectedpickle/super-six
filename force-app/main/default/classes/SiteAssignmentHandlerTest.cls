@isTest
public class SiteAssignmentHandlerTest {
    private static final Integer DEFAULT_BULK_RECORDS = 151;
    private static final Integer DEFAULT_SINGLE_RECORD = 1;
    private static final String PROFILE_DEFAULT_NAME = 'Standard Platform User';

    @testSetup
    public static void setupTests() {
    }


    @isTest
    public static void valid_single_site() {
        Test.startTest();

        User default_user = TestDataHelper.createTestUser(PROFILE_DEFAULT_NAME);
        List<Site_Assignment__c> site_junction_objects = TestDataHelper.createSiteJunctionObject(DEFAULT_SINGLE_RECORD);
        SiteAssignmentHandler.associateDefaultPerson(site_junction_objects, default_user.Id);
        System.debug(default_user.Id);
        System.debug(site_junction_objects.get(0).Person__c);
        System.assertEquals(default_user.Id, site_junction_objects.get(0).Person__c);

        Test.stopTest();
    }

    @isTest
    public static void valid_bulk_site() {
        Test.startTest();

        User default_user = TestDataHelper.createTestUser(PROFILE_DEFAULT_NAME);
        List<Site_Assignment__c> site_junction_objects = TestDataHelper.createSiteJunctionObject(DEFAULT_BULK_RECORDS);
        SiteAssignmentHandler.associateDefaultPerson(site_junction_objects, default_user.Id);
        for (Site_Assignment__C site : site_junction_objects) {
            System.assertEquals(default_user.Id, site.Person__c);
        }

        Test.stopTest();
    }
}