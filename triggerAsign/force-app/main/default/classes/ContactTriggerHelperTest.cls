@isTest
public class ContactTriggerHelperTest {
private static testmethod void ContactScoreRollupTriggerHandlerTest(){
        List<Contact> contactList = new List<Contact>();
        List<Account> accountList = new List<Account>();
        
        for(integer i=0; i<3; i++){
            Account acn = new Account();
            acn.Name = 'tesAccount'+i;
            acn.Score1__c = 50+i;
            acn.Score2__c = 40+i;
            accountList.add(acn);
        }
        insert accountList;
        
        for(integer i=0; i<3; i++){
            Contact cnd = new Contact();
            cnd.LastName = 'testmanage'+i;
            cnd.AccountId = accountList[i].Id;
            cnd.Score1__c = 50+i;
            cnd.Score2__c = 40+i;
            contactList.add(cnd);
        }
        test.startTest();
        ContactTriggerHelper.contAccRollUpAmount(contactList);
        test.stopTest();
    }
}