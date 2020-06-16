@isTest
public class CondidateTriggerHelperTest {
    private static testmethod void condidateTriggerHandlerTest(){
        List<Condidate__c> condidateList = new List<Condidate__c>();
        
        for(integer i=0; i<3; i++){
            if(i != 2){
                Condidate__c cnd = new Condidate__c();
                cnd.Name = 'Testing'+i;
                cnd.First_Name__c = 'check'+i;
                cnd.Last_Name__c = 'data'+i;
                cnd.Email__c = 'test@test.com';
                cnd.Brokerage__c = 'Annual'+i;
                cnd.Manage_Brokerage__c = 'Daily check'+i;
                cnd.Condidate_Status__c = 'Webinar - Attended';
                cnd.User_Created__c = true;
                condidateList.add(cnd);
            }
            else{
                Condidate__c cnd = new Condidate__c();
                cnd.Name = 'Testing'+i;
                cnd.First_Name__c = 'check'+i;
                cnd.Last_Name__c = 'data'+i;
                cnd.Email__c = 'test@test.com';
                cnd.Brokerage__c = 'Annual'+i;
                cnd.Condidate_Status__c = 'Webinar - Attended';
                cnd.User_Created__c = true;
                condidateList.add(cnd);
                
            }
            
        }
        test.startTest();
        CondidateTriggerHelper.setValForInsert(condidateList);
        test.stopTest();
    }
    
    private static testmethod void condidateTriggerHandlerAfter(){
        List<Condidate__c> condidateList = new List<Condidate__c>();
        
        for(integer i=0; i<3; i++){
            if(i != 2){
                Condidate__c cnd = new Condidate__c();
                cnd.Name = 'Testing'+i;
                cnd.First_Name__c = 'check'+i;
                cnd.Last_Name__c = 'data'+i;
                cnd.Email__c = 'test@test.com';
                cnd.Brokerage__c = 'Annual'+i;
                cnd.Manage_Brokerage__c = 'Daily check'+i;
                cnd.Condidate_Status__c = 'Webinar - Attended';
                cnd.User_Created__c = false;
                condidateList.add(cnd);
            }
            
            
        }
        test.startTest();
        CondidateTriggerHelper.afterUpdate(condidateList);
        test.stopTest();
    }

}