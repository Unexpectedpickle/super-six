trigger ContractEventTrigger on Contract_Event__e (after insert) {
	ContractEventTriggerHandler.createTasks(trigger.new);
}