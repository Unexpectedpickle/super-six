/*
    Created by: Grant Welton
    Description: This contains the logic for the Contract trigger that converts and inserts the area of the construction site.
    Last Update: 6 May, 2022
*/

@isTest
public class SiteAreaConversionTest {
    List<Contract> testContracts = TestDataHelper.createContracts(5);

    @isTest
    public static void TB_convertArea() {
        List<Contract> testContracts = TestDataHelper.createContracts(1);
        SiteAreaConversionHandler.convertArea(testContracts);
        System.assertEquals(1, testContracts[0].Area_Acres__c);
    }
}