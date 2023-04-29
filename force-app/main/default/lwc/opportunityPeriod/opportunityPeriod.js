import { LightningElement,track, wire, api } from 'lwc';
import findOpportunityPeriod from '@salesforce/apex/opportunityPeriodController.getOpportunityPeriod';
import totalProjectedRevenue from '@salesforce/apex/opportunityPeriodController.getTotalProjectedRevenue';
import updateOpportunityPeriod from '@salesforce/apex/opportunityPeriodController.updateOpportunityPeriodList';
import { refreshApex } from '@salesforce/apex';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';



export default class OpportunityPeriod extends LightningElement {
@track opportunityId = '';
@track toggleLabel = 'Save';
@track listofOportunityPeriod = [];
@track totalProjectedRevenue;
@api recordId;
@track error;
refreshTable;
    

@wire(totalProjectedRevenue, {opportunityId : '$recordId'}) wiredtotalProjectRevenue(result){
    if(result.data){
        this.totalProjectedRevenue = result.data;
    }
} 

connectedCallback(){
    this.opportunityId = this.recordId;
    this.OpportunityPeriod();
}
OpportunityPeriod(){
    findOpportunityPeriod({opportunityId : this.opportunityId})
    .then(result => {
        this.record = result;
        this.listofOportunityPeriod = this.record;
        this.error = undefined;
    })
    .catch(error => {
        this.error = error;
        this.record = undefined;
    });
}
handleOnChange(event){
    var num = '';
    let templistofOpportunityPeriod = JSON.parse(JSON.stringify(this.listofOportunityPeriod));
    templistofOpportunityPeriod.map(e =>{
        if(e.Id === event.target.dataset.id){
                e.Projected_Revenue__c = event.target.value;
        }
    })
    templistofOpportunityPeriod.map(e =>{
        if(e.Id === event.target.dataset.id){
                e.Preserve_Projected_Revenue__c = true;
        }
    })
    this.listofOportunityPeriod = templistofOpportunityPeriod;
    for(let i=0; i<this.listofOportunityPeriod.length; i++){
        if(num === ''){
            num = parseFloat(this.listofOportunityPeriod[i].Projected_Revenue__c,10);
        }else{
            num = parseFloat(num,10) + parseFloat(this.listofOportunityPeriod[i].Projected_Revenue__c);
        }
    }
    this.totalProjectedRevenue = num;
}
handleOnCheckBox(event){    
    let templistofOpportunityPeriod = JSON.parse(JSON.stringify(this.listofOportunityPeriod));
    templistofOpportunityPeriod.map(e =>{
        if(e.Id === event.target.dataset.id){
                e.Preserve_Projected_Revenue__c = event.target.checked;
        }
    })
    this.listofOportunityPeriod = templistofOpportunityPeriod; 
}
handleOnSave(){
    this.toggleLabel = 'Saving....';
    this.opportunityId = this.recordId;
    updateOpportunityPeriod({listofOppPeriod : JSON.stringify(this.listofOportunityPeriod)})
    .then(result => {
        this.toggleLabel = 'Save';
        this.dispatchEvent(new ShowToastEvent({
            title : 'Success',
            message : 'Records Updated',
            variant : 'Success',
        }),
        )
        this.OpportunityPeriod();
        this.error = undefined;
    })
    .catch(error => {
        console.log('@@@@@@@error'+error);
        this.error = error;
        this.record = undefined;
    })
}

}