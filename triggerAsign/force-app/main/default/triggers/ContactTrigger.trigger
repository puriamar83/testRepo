trigger ContactTrigger on Contact (after insert, after update, after delete) {
    if(trigger.isAfter)
        ContactTriggerHelper.contAccRollUpAmount(trigger.new);
}