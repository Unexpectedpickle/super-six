@isTest
public class ContractEventTriggerHandlerTest {
    private static final String DESCRIPTION = 'description';
    private static final Integer BULK_NUM = 151;
    
	@testSetup
    public static void setupTests() {
        
    }
    
    @isTest
    public static void valid_event_trigger_single() {
        List<Contract_Event__e> events = new List<Contract_Event__e>();
        events.add(TestDataHelper.buildContractEvent(DESCRIPTION, true));

        Test.startTest();
        Database.SaveResult sr = EventBus.publish(events.get(0));
        Test.stopTest();
        
        System.assert(true, sr.isSuccess());
        List<Task> tasks = [SELECT Id FROM Task];
        System.assertEquals(1, tasks.size());
    }
    
    @isTest
    public static void valid_event_trigger_multi() {
        List<Contract_Event__e> events = TestDataHelper.createEvents(BULK_NUM);

        Test.startTest();
        List<Database.SaveResult> sr = EventBus.publish(events);
        Test.stopTest();
        
        List<Task> tasks = [SELECT Id FROM Task];
        System.assertEquals(BULK_NUM, tasks.size());
    }
    
    @isTest
    public static void nonactive_event_trigger() {
        List<Contract_Event__e> events = new List<Contract_Event__e>();
        events.add(TestDataHelper.buildContractEvent(DESCRIPTION, false));

        Test.startTest();
        Database.SaveResult sr = EventBus.publish(events.get(0));
        Test.stopTest();
        
        System.assert(true, sr.isSuccess());
        List<Task> tasks = [SELECT Id FROM Task];
        System.assertEquals(0, tasks.size());
    }
}