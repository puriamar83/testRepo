public class ContactTriggerHelper {
    
    public static void contAccRollUpAmount(List<Contact> contactList){
        List<Contact> cont = new List<Contact>([Select AccountId, Score1__c, Score2__c
                                                from Contact 
                                                where id in: contactList]);
        List<Account> accList = new List<Account>([Select id, Score1__c, Score2__c 
                                                   from Account Limit 50000]);
        List<Account> accListToUpdate = new List<Account>();
        for(Account acct: accList){
            Double amtX = 0;
            Double amtY = 0;
            for(Contact con: cont){
                if(con.AccountId == acct.Id){
                    if(con.Score2__c != NULL){
                        if(con.Score1__c == acct.Score1__c){
                            amtX = con.Score2__c;
                        } else if(con.Score1__c == acct.Score2__c){
                            amtY = con.Score2__c;
                        }
                    }
                }
            }
            if(amtX != 0){
                acct.Score1__c += amtX;          
            }
            if(amtY != 0){
                acct.Score2__c += amtY;
            }
            accListToUpdate.add(acct);
        }
        if(accListToUpdate.size()>0){
            update accListToUpdate;    
        }
    }   
}