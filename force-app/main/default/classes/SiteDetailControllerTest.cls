@isTest
public class SiteDetailControllerTest {
    
    @testSetup
    public static void setupTests() {
        // Create Site
        Site__c site_to_insert = new Site__c(Name='Testing Site');
        Insert site_to_insert;
        
        // Create Site junction object
        Site_Assignment__c junction_object = new Site_Assignment__c(Site__c = site_to_insert.Id);
        Insert junction_object;
    }
    
    @isTest
    public static void testConstructorPositive() {
        Test.startTest();
        SiteDetailController controller = new SiteDetailController();
        Test.stopTest();
        System.assert(!controller.all_sites_list.isEmpty(), 'No sites retrieved from controller');
    }
}