import { LightningElement, wire } from 'lwc';
import getTasks from '@salesforce/apex/TaskController.getTasks';
import completeTask from '@salesforce/apex/TaskController.completeTask';
import { refreshApex } from '@salesforce/apex';

export default class TaskList extends LightningElement {
    tasks;
    wiredTasksResult;

    columns = [
        { label: 'Name', fieldName: 'Name' },
        { label: 'Due Date', fieldName: 'Due_Date__c', type: 'date' },
        { label: 'Completed', fieldName: 'Completed__c', type: 'boolean' },
        {
            type: 'action',
            typeAttributes: { rowActions: [{ label: 'Mark Complete', name: 'complete' }] }
        }
    ];

    @wire(getTasks)
    wiredTasks(result) {
        this.wiredTasksResult = result;
        if (result.data) {
            this.tasks = result.data;
        }
    }

    handleRowAction(event) {
        const actionName = event.detail.action.name;
        const row = event.detail.row;
        if (actionName === 'complete' && !row.Completed__c) {
            completeTask({ taskId: row.Id })
                .then(() => refreshApex(this.wiredTasksResult))
                .catch(error => console.error(error));
        }
    }
}