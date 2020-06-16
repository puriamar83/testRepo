trigger TaskTrigger on Task (before insert) {
    if(trigger.isInsert && trigger.isBefore){
        TaskTriggerHelper.onbefore(trigger.new);
    }
}