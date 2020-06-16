trigger ContactTotalFamilyMembers on Contact (after insert, after delete, after update, after undelete) {
    Map<String, List<Contact>> mapOfAccContacts = new Map<String, List<Contact>>();
    Map<String, List<Contact>> mapAccIdDelCon = new Map<String, List<Contact>>();
    List<Contact> listOfContact = new List<Contact>();
    List<Contact> listOfUpdateContact = new List<Contact>();
    List<Account> lstAcc = new List<Account>();
    Set<String> setOfAccIds = new Set<String>();
    
    if(trigger.isInsert || trigger.isUndelete || trigger.isUpdate){
        for(Contact con : trigger.new){
            if(con.AccountId != null){
                setOfAccIds.add(con.AccountId);
            }
        }
    }
    if(trigger.isDelete || trigger.isUpdate){
        for(Contact con : trigger.old){
            if(con.AccountId != null){
                setOfAccIds.add(con.AccountId);
            }
        }
    }
    if(setOfAccIds.size()>0){
        listOfContact = [SELECT id,Total_Family_Members__c,accountId from Contact WHERE AccountId IN : setOfAccIds];
        if(listOfContact.size()>0){
            for(Contact objCon : listOfContact){
                List<Contact> templistOfContact = new List<Contact>();
                if(mapOfAccContacts.containsKey(objCon.accountId)){
                    templistOfContact = mapOfAccContacts.get(objCon.accountId);
                }
                templistOfContact.add(objCon);
                mapOfAccContacts.put(objCon.accountId,templistOfContact);
            }
            if(mapOfAccContacts.size()>0){
                for(Contact objCon : listOfContact){
                    if(objCon.Total_Family_Members__c != mapOfAccContacts.get(objCon.accountId).size()){
                        objCon.Total_Family_Members__c = mapOfAccContacts.get(objCon.accountId).size();
                        listOfUpdateContact.add(objCon);
                    }
                }
            }
        }
        if(listOfUpdateContact.size()>0){
            update listOfUpdateContact;
        }
    }
}