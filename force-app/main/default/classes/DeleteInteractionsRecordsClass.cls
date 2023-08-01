public class DeleteInteractionsRecordsClass 
implements  Database.Batchable<sObject> 
{
   public Database.QueryLocator start(Database.BatchableContext bc)  {
        // collect the batches of records or objects to be passed to execute
           Integer Limitrecords = (Integer)Global_Parameters__mdt.getInstance('w').ToDelete__c;
          return Database.getQueryLocator([Select id from Interactions__c limit :Limitrecords]);
    }
    public void execute(Database.BatchableContext bc, List<Interactions__c> records)
    {
        // process each batch of records
            delete records;
    }
    public void finish(Database.BatchableContext bc){
        // execute any post-processing operations
          System.debug(' records processed');
    }
}