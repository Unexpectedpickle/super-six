public class ContractEventTriggerHandler {
    private static final String DEFAULT_TASK_PRIORITY = 'MEDIUM';
    private static final String DEFAULT_TASK_DESCRIPTION = 'Contract has been created and assigned to you.';
    
    public static void createTasks(List<Contract_Event__e> events) {
        List<Task> tasksToCreate = new List<Task>();
        Group queue = [SELECT Id FROM Group WHERE Name='Contract Queue' AND Type='Queue' LIMIT 1];
        for (Contract_Event__e event : events) {
            if (event.Active_Contract__c == true) {
                tasksToCreate.add(buildTask(event));
            }
        }
        insert tasksToCreate;
    }
    
    private static Task buildTask(Contract_Event__e event) {
        Task newTask = new Task();
        newTask.Priority = DEFAULT_TASK_PRIORITY;
        newTask.Description = event.Description__c == null 
            ? DEFAULT_TASK_DESCRIPTION 
            : event.Description__c;
        newTask.OwnerId = event.CreatedById;
        return newTask;
    }
}