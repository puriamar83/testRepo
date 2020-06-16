public with sharing class QuoteTriggerHelper{
    
    public static void beforInsert(List<Quote> qt){
        setSalesTax(qt);
    }
    
    public static void setSalesTax(List<Quote> qt){
        Map<String ,Id> salMap = new Map<String ,Id>();
        FOR(Sales_Tax__c SAL : [select Id,City__c,State__c from Sales_Tax__c]) {
            salMap.put(SAL.City__c+ '-' +SAL.State__c, SAL.Id);
        }
        
        for(Quote qItem : qt){
            System.debug('Item:'+qItem);
            if((qItem.BillingCity != null ||qItem.BillingCity != '') && (qItem.BillingState != null || qItem.BillingState !='')) {
                if(salMap.containsKey(qItem.BillingCity+ '-' +qItem.BillingState))
                    qItem.Sales_Tax__c = salMap.get(qItem.BillingCity+ '-' +qItem.BillingState);
            }
            
            
            
        }
    }
}