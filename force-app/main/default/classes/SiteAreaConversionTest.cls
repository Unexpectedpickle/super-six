/*
    Created by: Grant Welton
    Description: This contains the logic for the Contract trigger that converts and inserts the area of the construction site.
    Last Update: 6 May, 2022
*/

@isTest
public class SiteAreaConversionTest {

    @isTest
    public static void TB_convertArea() {
        Test.startTest();
        
        List<Contract> testContracts = TestDataHelper.createContractsWithSquareFeet(1);
        SiteAreaConversionHandler.convertArea(testContracts);
        System.assertEquals(1, testContracts[0].Area_Acres__c.setScale(0));
        
        Test.stopTest();
    }
    
    @isTest
    public static void TB_convertArea1() {
        Test.startTest();
        
        List<Contract> newTestContracts = TestDataHelper.createContractsWithAreaAcres(1);
        SiteAreaConversionHandler.convertArea(newTestContracts);
        System.assertEquals(1, newTestContracts[0].square_feet__c.setScale(0));
        
        Test.stopTest();
    }
}
