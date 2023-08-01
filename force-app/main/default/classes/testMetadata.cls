public class testMetadata {
    
     public static void  GetValue() {
       /*Global_Parameters__mdt supportTier = new Global_Parameters__mdt();
        supportTier.DeveloperName = myName;
        return supportTier;*/
          Global_Parameters__mdt [] minSpent  = [SELECT ToDelete__c FROM Global_Parameters__mdt LIMIT 1];
         
          Integer recordsLimit = (Integer)Global_Parameters__mdt.getInstance('w').ToDelete__c;
   
        // Integer valor = (Integer) minSpent[0].ToDelete__c;
         
     //System.debug('Valor de metadata=' + minSpent[0].ToDelete__c); 
     System.debug('Valor de metadata=' + recordsLimit); 
         
         
          /* list<Interactions__c> contactstodelete = [Select id from Interactions__c order by desc created limit :valor];
       
         try {
    delete contactstodelete;
} catch (DmlException e) {
    System.debug('Error=' + e); 
}*/
     
     }
    
}