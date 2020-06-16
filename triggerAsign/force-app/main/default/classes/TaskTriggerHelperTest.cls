@isTest
public class TaskTriggerHelperTest {
    static testMethod void testWeekendTasks() {
        List<Task> tas = new List<Task>();
        for(integer i = 0 ; i<7; i++){
            Task t = new Task();
            t.ActivityDate = Date.today()+i;
            tas.add(t);
        }
        
        insert tas;
    }
}