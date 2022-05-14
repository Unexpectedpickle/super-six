/*
    Created by: Grant Welton
    Description: This contains the logic for the Contract trigger that calculates and inserts the
    Last Update: 6 May, 2022

    What the trigger should do:
    1. Trigger on the square footage field of the Contract sObject
    2. When the square footage field is either created or updated, it should convert
       that number from square feet to acres.
    3. After calculating, it should store that number into the Area (acres) field.
*/

public class SiteAreaConversionHandler {

    public static List<Contract> convertArea(List<Contract> contractList) {
        Decimal numToConvert = 0;

        for(Contract cont : contractList) {
            if(cont.Area_Acres__c == null) {
                numToConvert = cont.Square_Feet__c * 0.0000229568;
                cont.Area_Acres__c = numToConvert;
            } else if(cont.Square_Feet__c == null) {
                numToConvert = cont.Area_Acres__c * 43560;
                cont.Square_Feet__c = numToConvert;
            }
        }
        return contractList;
    }
}