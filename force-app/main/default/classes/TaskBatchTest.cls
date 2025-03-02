@isTest
private class TaskBatchTest {
    @TestSetup
    static void makeData() {
        List<Task__c> tasks = new List<Task__c>();
        tasks.add(new Task__c(Name = 'Test Overdue', Due_Date__c = Date.today().addDays(-1), Completed__c = false));
        tasks.add(new Task__c(Name = 'Test Future', Due_Date__c = Date.today().addDays(1), Completed__c = false));
        insert tasks;
    }

    @isTest
    static void testBatch() {
        Test.startTest();
        TaskBatch batch = new TaskBatch();
        Database.executeBatch(batch);
        Test.stopTest();

        Task__c overdue = [SELECT Completed__c FROM Task__c WHERE Name = 'Test Overdue' LIMIT 1];
        System.assertEquals(true, overdue.Completed__c, 'Overdue task should be completed');
    }
}