import { LightningElement } from 'lwc';
import getContacts from '@salesforce/apex/ContactController.getContacts';
import saveContacts from '@salesforce/apex/ContactController.saveContacts';
import newContact from '@salesforce/apex/ContactController.newContact';

export default class ContactDetail extends LightningElement {
    searchString = '';
    contactList = [];

    retrieveContacts(event)
    {
        this.searchString = event.detail.value;
        getContacts({Objectname : 'Contact', name : this.searchString})
        .then(result =>{
            this.contactList = result;
            console.log('@@@@@@@@@'+JSON.stringify(this.contactList));
        })
        .catch(error =>{
            console.log('@@@@@@@@@'+JSON.stringify(error));
        })
    }

    handleOnChange(event){

        var conupdate;
        for(var i = 0; i<contactList; i++){
            if(event.detail.data.name = contactList[i].id){
                this.contactList[i].Name = event.detail.value;
            }
        }

    }

    updateContacts()
    {
        var conListString = JSON.stringify(contactList);
        saveContacts({contactList : conListString})
        .then(result =>{
            this.contactList = result;
        })
        .else(error =>{

        }) 
    }

    updateContacts()
    {
        saveContacts({contactList : conListString})
        .then(result =>{
            this.contactList.push(result);
        })
        .else(error =>{

        }) 
    }




}