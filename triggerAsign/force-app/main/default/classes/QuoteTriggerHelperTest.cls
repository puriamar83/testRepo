@isTest
public class QuoteTriggerHelperTest {
	@isTest
    public static void beforInsertmethod(){
        Sales_Tax__c st = new Sales_Tax__c(Name = 'SalesTest', City__c='Mumbai', State__c = 'Maharashtra', Sales_Tax__c = 18.0);
        insert st;
        List<Quote> quotelst = new List<Quote>();
        quotelst.add(new Quote(Name = 'Test',Sales_Tax__c = st.Id));
        Test.startTest();
        QuoteTriggerHelper.beforInsert(quotelst);
        System.assertEquals(st.Id, quotelst[0].Sales_Tax__c);
        Test.stopTest();
    }
}