# TaskManager Salesforce Project

## Overview
This Salesforce project provides a task management solution with a custom `Task__c` object, a Lightning Web Component (`taskList`), an Apex batch job (`TaskBatch`), and a REST endpoint (`TaskRestService`).


## Prerequisites
- Salesforce CLI (`sf`) installed: [Installation Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_setup.meta/sfdx_setup/sfdx_setup_install_cli.htm)
- A Salesforce org (e.g., Developer Edition or scratch org)
- VS Code (recommended) with Salesforce Extension Pack


## Deployment Instructions
1. Clone this repository:

    ```sh
    git clone https://github.com/CyrusNchege/SalesforceTaskManager.git
    ```

2. Open the project in VS Code and authorize a scratch org:

    ```sh
    sf org login web
    ```

3. Deploy the source to the org:

    ```sh
    sf project deploy start
    ```

## Accessing the LWC
1. In Setup > Lightning App Builder, create a new Lightning Page (e.g., "Task App").
2. Drag the `taskList` component onto the page and save.
3. Activate the page and view it via the App Launcher.

## Running the Batch Job
1. Open Developer Console > Debug > Open Execute Anonymous Window.
2. Run:

    ```apex
    Database.executeBatch(new TaskBatch());
    ```

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
- Ran test class with:

    ```sh
    sf apex run test -n TaskBatchTest
    ```

### REST Endpoint
- Tested in Workbench with GET `/services/apexrest/Tasks/`.

    [Workbench](https://workbench.developerforce.com/).
- Log in and navigate to Utilities > REST Explorer.
- Select GET and enter `/services/apexrest/Tasks/`.
- Sample response: `[{"Name": "Task 1", "Due_Date__c": "2025-03-01", "Completed__c": true}]`.


## GitHub Repository
- Structure:
  - `force-app/main/default/objects/Task__c/...`
  - `force-app/main/default/lwc/taskList/...`
  - `force-app/main/default/classes/...` (Apex, tests, REST class)
  - [README.md](README.md)