public with sharing class OpportunityTriggerHandler extends TriggerHandler {

    public override void beforeUpdate(){

        marcarRevisionEnOportunidad((Map<Id,Opportunity>) Trigger.oldMap ,(list<Opportunity>) Trigger.new);

        


        //***********************************************************************************/
        //No todo el codigo en la clase, se recomienda modularlo en metodos para mas claridad
        //***********************************************************************************/
        /*Map<Id, Opportunity> oldOppMap  = (Map<Id, Opportunity>) Trigger.oldMap;
        for (Opportunity currentOportunity : (list<Opportunity>) Trigger.new) 
        {
            if(oldOppMap.get(currentOportunity.Id).Type != currentOportunity.Type &&
               oldOppMap.get(currentOportunity.Id).StageName != currentOportunity.StageName &&
               oldOppMap.get(currentOportunity.Id).Amount != currentOportunity.Amount)
               {
                    currentOportunity.Necesita_revision__c = true;
               }
        }*/
    }

    public override void beforeInsert(){
        marcarOportunidadesPreferentes((list<Opportunity>) Trigger.new);
    }

    public override void afterInsert(){
        crearContactoPredeterminado((list<Opportunity>) Trigger.new);
    }

    public override void beforeDelete(){
        PrevenirBorrarOportunidadConGerente((list<Opportunity>) Trigger.old);
    }
    
    public override void afterDelete(){
        HelperClassTrigger.CrearRegistroAuditoria((list<Opportunity>) Trigger.old, 'Opportunidad');
    }



   private void  marcarRevisionEnOportunidad(Map<Id, Opportunity> mapOldOppRecords , list<Opportunity> lstOpp){
       for (Opportunity currentOportunity : lstOpp ) 
        {
            Opportunity oldOppRecords = mapOldOppRecords.get(currentOportunity.Id);
            if( oldOppRecords.Type      != currentOportunity.Type &&
                oldOppRecords.StageName != currentOportunity.StageName &&
                oldOppRecords.Amount    != currentOportunity.Amount) 
               {
                    currentOportunity.Necesita_revision__c = true;
               }
        }
   }

   private void actualizarMontosParaCuenta(List<Opportunity> lstNewOppRecord, Map<Id,Opportunity> mapOldOppRecords)
   {
    Set<ID> setAccIds = new Set<ID>();
    for (Opportunity currentOpportunity : lstNewOppRecord) {
        Opportunity oldOppRecord = mapOldOppRecords.get(currentOpportunity.Id);
        if(currentOpportunity.AccountId != null &&
           oldOppRecord.Amount != currentOpportunity.Amount)
           {
                setAccIds.add(currentOpportunity.Id);
           }
    }

    Map<Id,Decimal> mapAccWithSumAmounts = new Map<Id,Decimal>();
    for (Opportunity OpportunityToSum : [SELECT Amount, AccountId from Opportunity where AccountId IN : setAccIds AND Amount != NULL]) {
        if (mapAccWithSumAmounts.containsKey(OpportunityToSum.AccountId)) {
            Decimal finalAmount = mapAccWithSumAmounts.get(OpportunityToSum.AccountId) + OpportunityToSum.Amount;
            mapAccWithSumAmounts.put(OpportunityToSum.AccountId, finalAmount);
        }else {
            mapAccWithSumAmounts.put(OpportunityToSum.AccountId, OpportunityToSum.Amount);
        }
        List<Account> lstAccToUpdate  = new List<Account>();

        // falta completar
    }


   }

   private void marcarOportunidadesPreferentes (List<Opportunity> lstNewOppRecord)
   {

        for (Opportunity currentOportunity : lstNewOppRecord) {
            if(currentOportunity.Amount >= 1000000)
            {
                currentOportunity.Type = 'Preferente';
            }

        }

   }

   private void crearContactoPredeterminado(List<Opportunity> lstNewOppRecord){
    List<Contact> lstcontactToInsert  = new List<Contact>();
    for (Opportunity currentOportunity : lstNewOppRecord) {
        if(currentOportunity.AccountId == null)
        {
            Contact accToInsert = new Contact();
            accToInsert.LastName = 'Contacto de la Oportunidad' + currentOportunity.Name;
            lstcontactToInsert.add(accToInsert);
        }
    }

    insert lstcontactToInsert;

   }

   private void PrevenirBorrarOportunidadConGerente(List<Opportunity> lstNewOppRecord){

    for (Opportunity currentOportunity : lstNewOppRecord) {

        if(currentOportunity.Gerente__c == null)
        {
            currentOportunity.addError('Debe Ingresar un gerente');
        }
   }

}



}