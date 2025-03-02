public with sharing class TaskController {
    @AuraEnabled
    public static void completeTask(Id taskId) {
        // Query the Task__c record
        Task__c task = [SELECT Id, Completed__c FROM Task__c WHERE Id = :taskId LIMIT 1];
        
        // Update the task
        task.Completed__c = true;
        update task;
    }

    @AuraEnabled
    public static List<Task__c> getTasks() {
        // Retrieve all Task__c records
        return [SELECT Id, Name, Due_Date__c, Completed__c FROM Task__c];
    }
}