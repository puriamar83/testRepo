trigger CondidateTrigger on Condidate__c (after insert,after update) {
    if(trigger.isInsert && trigger.isAfter){
        CondidateTriggerHelper.setValForInsert(trigger.new);
    }
    if(trigger.isUpdate && trigger.isAfter){
        CondidateTriggerHelper.afterUpdate(trigger.new);
    }
    
}