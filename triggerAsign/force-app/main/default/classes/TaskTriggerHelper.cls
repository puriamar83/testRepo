public class TaskTriggerHelper {
    public static void onbefore(List<Task> taskList ){
        for ( Task tas : taskList )
        {
            if ( tas.ActivityDate != null )
            {
                Date origin = Date.newInstance(1900,1,6);
                Date due = tas.ActivityDate;
                Integer x = origin.daysBetween(due);
                Integer day = Math.mod(x,7);
                
                if ( day == 0 ) // Saturday
                {
                    tas.ActivityDate = (tas.ActivityDate -1);
                }
                else if ( day == 1 ) // Sunday
                {
                    tas.ActivityDate = (tas.ActivityDate -2);
                }
            }
        }
        
    }
}