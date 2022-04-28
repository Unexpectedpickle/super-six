trigger SiteAssignmentTrigger on Site_Assignment__c (before insert) {
    SiteAssignmentHandler.associateDefaultPerson(trigger.new, UserInfo.getUserId());
}