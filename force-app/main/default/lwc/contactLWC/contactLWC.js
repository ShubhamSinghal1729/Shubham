import { LightningElement,api,wire,track} from 'lwc';
import {getPicklistValues} from 'lightning/uiObjectInfoApi';
import stage from '@salesforce/schema/Contact.Stage__c';
import Contact_Object from '@salesforce/schema/Contact'; 
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import getContactList from '@salesforce/apex/contactApexController.listofContact';
import handleonSave   from '@salesforce/apex/contactApexController.saveContact';
import handleNew   from '@salesforce/apex/contactApexController.newContact';


export default class ContactLWC extends LightningElement {
    @api recordId;
    @track contacts;
    @track contact;
    @track contactList = [];

    @wire(getPicklistValues , {fieldapiname : stage})
    stagevalues;

    @wire(getContactList, {accountId : '$recordId'})
    wiredcontacts({error,data}){
        if(data){
           this.contacts = data;
           for(var i = 0; i < this.contacts.length; i++){
               this.contactList.push(this.contacts[i]);
           }
        } else if(error){
            console.log('@@@@@@'+JSON.stringify(error));
        }
    }

    handleonchange(event){
        this.contact = this.contacts[event.target.dataset.index];
        this.contact = {...this.contact, [event.target.name] : event.target.value};
        this.contactList = [];
        for(var i = 0; i < this.contacts.length; i++){
            if(i ==event.target.dataset.index){
            this.contactList.push(this.contact);
            }else{
            this.contactList.push(this.contacts[i]);
            }
        }
        this.contacts = [];
        this.contacts = this.contactList;
    }

    handlelookupChange(event){
        this.contact = this.contacts[event.detail.index];
        this.contact = {...this.contact, [event.detail.fieldname] : event.detail.selectedRecordId};
        this.contactList = [];
        for(var i = 0; i < this.contacts.length; i++){
            if(i ==event.detail.index){
            this.contactList.push(this.contact);
            }else{
            this.contactList.push(this.contacts[i]);
            }
        }
        this.contacts = [];
        this.contacts = this.contactList;
        console.log('@@@@@@@@'+JSON.stringify(this.contacts));
    }

    handleonSave(){
        handleonSave({listofContact : this.contacts})
        .then(result =>{
            const evt = new ShowToastEvent({
                title: 'Success',
                message: 'Opearion sucessful',
                variant: 'success',
                mode: 'dismissable'
            });
            this.dispatchEvent(evt);
             this.contacts = result;   
        })
        .catch(error => {
            console.log('@@@@@@'+JSON.stringify(error));
        });
    }

    handleonNew(){
        handleNew({listofContact : this.contacts, accountId : this.recordId})
        .then(result =>{
             this.contacts = result;   
             console.log('@@@@@@'+JSON.stringify(this.contacts));
        })
        .catch(error => {
            console.log('@@@@@@'+JSON.stringify(error));
        });
    }
}