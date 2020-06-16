trigger quoteTrigger on Quote (before insert,before update) {
    if((trigger.isInsert || trigger.IsUpdate ) && trigger.isBefore){
        System.debug('Inside QuoteTrigger');
        QuoteTriggerHelper.beforInsert(trigger.new);
    }
}