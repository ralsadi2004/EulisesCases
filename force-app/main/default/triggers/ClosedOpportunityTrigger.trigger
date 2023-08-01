trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {

    List<Task> oppTask = new List<Task>();  
    
    for(Opportunity o : Trigger.new){
        if(o.StageName == 'Closed Won'){
             oppTask.add(new Task(subject ='Follow Up Test Task',WhatId=o.Id));
        }
    }    
    
    if(oppTask.size() > 0) {
        insert oppTask;
    }
    
}