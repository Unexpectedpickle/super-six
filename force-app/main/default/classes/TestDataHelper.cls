@isTest
public class TestDataHelper {
    
    public static User createTestUser(String profileName) {
        Id profileId = [SELECT Id FROM Profile WHERE Name=:profileName LIMIT 1].Id;
        User test_user = new User();
        test_user.Alias = 'test';
        test_user.Email = 'test@testy.com';
        test_user.FirstName = 'test';
        test_user.LastName = 'testy';
        test_user.ProfileId = profileId;
        test_user.Username = 'asdfghdhfgawefasdc@testtest.com';
        test_user.TimeZoneSidKey = 'America/Los_Angeles';
        test_user.LanguageLocaleKey='en_US';
        test_user.LocaleSidKey = 'en_US';
        test_user.EmailEncodingKey = 'UTF-8';

        Insert test_user;
        return test_user;
    }

    public static List<Site_Assignment__c> createSiteJunctionObject(Integer numSiteJunction) {
        List<Site_Assignment__c> site_junctions = new List<Site_Assignment__c>();
        for (Integer i =0; i < numSiteJunction; i++) {
            site_junctions.add(new Site_Assignment__c());
        }
        return site_junctions;
    }

    public static List<Contract> createContractsWithSquareFeet(Integer numContracts) {
        List<Contract> contractList = new List<Contract>();

        for(Integer i = 0; i<numContracts; i++) {
            contractList.add(new Contract(name = 'Contract' + i, Square_Feet__c = 43560));
        }
        return contractList;
    }

    public static List<Contract> createContractsWithAreaAcres(Integer numContracts) {
        List<Contract> contractList = new List<Contract>();

        for(Integer i = 0; i<numContracts; i++) {
            contractList.add(new Contract(name = 'Contract' + i, Area_Acres__c = 0.0000229568));
        }
        return contractList;
    }
    
    public static List<Contract_Event__e> createEvents(Integer numEvents) {
        List<Contract_Event__e> event_list = new List<Contract_Event__e>();
        for (Integer i = 0; i < numEvents; i++) {
            event_list.add(buildContractEvent(null, true));
        }
        return event_list;
    }
    
    public static Contract_Event__e buildContractEvent(String description, Boolean active) {
        Contract_Event__e newEvent = new Contract_Event__e();
        newEvent.Description__c = description;
        newEvent.Active_Contract__c = active;
        return newEvent;
    }
}