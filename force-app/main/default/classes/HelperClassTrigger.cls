public class HelperClassTrigger {
    public static void  (List<SObject> lstSobjectRecords, String nombreObjeto)
    {
        List<Auditoria__c> lstAuditoriaToInsert = new List<Auditoria__c>();
        for (sObject currenSObject : lstSobjectRecords) {
            Auditoria__c objAuditoria = new Auditoria__c();
            objAuditoria.Name =  String.valueOf(currenSObject.get('name'));
            objAuditoria.Nombre_de_Objeto__c = nombreObjeto;

            lstAuditoriaToInsert.add(objAuditoria);
        }

        insert lstAuditoriaToInsert;
    }
}  