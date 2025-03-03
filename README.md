# TaskManager Salesforce Project

## Overview
This project implements a Salesforce solution to manage tasks with a custom object, LWC, batch job, and REST endpoint.

## Deployment Instructions
1. Clone this repository: 

    ```
    git clone https://github.com/CyrusNchege/SalesforceTaskManager.git
    ```


2. Open in VS Code and authorize a scratch org: `sfdx force:auth:web:login`.
3. Deploy to the org: `sfdx force:source:push`.
4. Assign permissions to `Task__c` via a Permission Set if needed.

## Accessing the LWC
1. In Setup > Lightning App Builder, create a new Lightning Page (e.g., "Task App").
2. Drag the `taskList` component onto the page and save.
3. Activate the page and view it via the App Launcher.

## Running the Batch Job
1. Open Developer Console > Debug > Open Execute Anonymous Window.
2. Run: `Database.executeBatch(new TaskBatch());`.
3. Optional: Schedule via Setup > Apex Classes > Schedule Apex.

## Testing

### Custom Object
- Created via Setup and verified fields in Object Manager.
- Added test records via the "Tasks" tab.

### LWC
- Added to a Lightning App Page ("Task List App").
- Confirmed table displays records and "Complete" button updates tasks.

### Batch Job
- Ran `Database.executeBatch(new TaskBatch())` in Developer Console.
- Verified overdue tasks (e.g., due 2025-02-28) marked as completed.
- Ran test class with `sf apex run test -n TaskBatchTest`.

### REST Endpoint
- Tested in Workbench with GET `/services/apexrest/Tasks/`.
- Sample response: `[{"Name": "Task 1", "Due_Date__c": "2025-03-01", "Completed__c": true}]`.