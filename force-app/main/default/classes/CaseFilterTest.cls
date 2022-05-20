@isTest
public class CaseFilterTest {

    @isTest
    public static void TP_IsDisplayed() {
        Test.startTest();
        
        List<Case> newCases = new List<Case>();
        Case testCase = new Case();
        testCase.Priority = 'High';
        newCases.add(testCase);
        Insert newCases;
        
        ApexPages.StandardSetController stdSetController = new ApexPages.StandardSetController(newCases);
        CaseFilterExtension testCaseFilter = new CaseFilterExtension(stdSetController);
        Test.stopTest();
        System.assert(!testCaseFilter.displayedCases.isEmpty(), 'Test passed');
    }
    
    @isTest
    public static void TP_IsFiltered() {
        Test.startTest();
        
        List<Case> newCases = new List<Case>();
        Case testCase = new Case();
        testCase.Priority = 'High';
        testCase.Type = 'Electrical';
        testCase.Reason = 'Performance';
        newCases.add(testCase);
        Insert newCases;
        
        List<Case> filteredCases = new List<Case>();
        List<Case> displayedCases = new List<Case>();
        ApexPages.StandardSetController stdSetController = new ApexPages.StandardSetController(newCases);
        CaseFilterExtension testCaseFilter = new CaseFilterExtension(stdSetController);
        testCaseFilter.filter = 'High';
        testCaseFilter.filteredList();
        testCaseFilter.filter = 'Electrical';
        testCaseFilter.filteredList();
        testCaseFilter.filter = 'Performance';
        testCaseFilter.filteredList();
        Test.stopTest();
    }
}