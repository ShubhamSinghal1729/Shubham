import { LightningElement, wire, track } from 'lwc';
import getInstances from '@salesforce/apex/APItoupdateOpportunity.getInstances';
import getObjects from '@salesforce/apex/APItoupdateOpportunity.getObjects';     
import getData from '@salesforce/apex/APItoupdateOpportunity.getData';

export default class Migration extends LightningElement {
    @track openInstance= false;
    @track listofInstance;
    @track error;
    @track instance;
    @track openObject = false;
    @track listofObject;
    @track object;
    @track openData = false;
    @track data;
    @track datatoshow = [];
    @track initialnumber = 0;
    @track finalnumber = 9;
    showInstances() {
        this.openInstance = true;
        getInstances()
        .then(result => {
              this.listofInstance = result;
              console.log('@@@@@@@@@listofInstance'+this.listofInstance);
        })
        .catch(error =>{
              this.error = error;
              console.log('@@@@@@@@@@@@error'+this.error);
        }
        )
    }
    closeInsatnces() {
        this.openInstance = false;
    }
    selectedinstances(event){
        this.instance = event.target.value;
   }
    showObject(){
        this.openInstance = false;
        this.openObject = true;
        getObjects({instance : this.instance})
        .then(result => {
              this.listofObject = result;
              console.log('@@@@@@@@@listofInstance'+this.listofObject);
        })
        .catch(error => {
            this.error = error;
            console.log('@@@@@@@@@listofInstance'+this.error);
        })

    }
    closeObject(){
        this.openObject = false;
    }
    selectedObject(event){
        this.object = event.target.value;
   }

   showdata(){
    this.openInstance = false;
    this.openObject = false;
    this.openData = false;   
    getData({instance : this.instance})
    .then(result =>{
        this.data = result;
        for(let i = this.initialnumber; i<= this.finalnumber; i++){
            this.datatoshow.push({label : i,value : this.data.records[i]});
        }
        console.log('@@@@@@@@@@@@@@@@@@@@data'+this.data+'@@@@@@@@@@@@listsize'+this.data.records);
    })
    .catch(error => {
        this.error = error;
        console.log('@@@@@@@@@@@@@error'+this.error);
    })

   }
    
}