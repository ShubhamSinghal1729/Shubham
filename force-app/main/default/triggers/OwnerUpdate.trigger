trigger OwnerUpdate on Lead (before insert) {    
    if(Trigger.isBefore && Trigger.isInsert){   
        OwnerUpdateHandler.updateOwneroflead(trigger.New);
    }  
}