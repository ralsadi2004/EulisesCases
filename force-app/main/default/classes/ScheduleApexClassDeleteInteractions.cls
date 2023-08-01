public class ScheduleApexClassDeleteInteractions implements Schedulable{

     public void execute(SchedulableContext ctx) {
        // awesome code here
        DeleteInteractionsRecordsClass myBatchObject = new DeleteInteractionsRecordsClass();
		Id batchId = Database.executeBatch(myBatchObject);
 		System.debug('BatchID:' + batchId);
    }
}