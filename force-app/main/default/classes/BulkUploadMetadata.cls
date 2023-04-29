/**
 *@Desc: A class that can be used to insert and update multiple custom metadata records in a single transaction. 
 **/
public class BulkUploadMetadata {    
    /**
     *@desc: A method to insert multiple records for custom metadata object in a single go. 
	 **/
    public void insertbulkMetadata(){
    //    try{
            Metadata.DeployContainer mdContainer = new Metadata.DeployContainer();
            String nameSpacePrefix =''; // if the metadata belongs to any package than include the namespace.                
            //First Record 
            Metadata.CustomMetadata firstMetadataRec =  new Metadata.CustomMetadata();
            firstMetadataRec.fullName = nameSpacePrefix + 'Bulk_Upload__mdt.FirstRec';
            firstMetadataRec.label = 'FirstRec';           
            //adding values to fields
            Metadata.CustomMetadataValue customField1 = new Metadata.CustomMetadataValue();
            customField1.field = 'RecName__c';
            customField1.value = 'FirstRecordName';
            firstMetadataRec.values.add(customField1);            
            Metadata.CustomMetadataValue customField2 = new Metadata.CustomMetadataValue();
            customField2.field = 'Is_Displayed__c';
            customField2.value = True;
            firstMetadataRec.values.add(customField2);                       
            Metadata.CustomMetadataValue customField3 = new Metadata.CustomMetadataValue();
            customField3.field = 'NameType__c';
            customField3.value = 'First';
            firstMetadataRec.values.add(customField3);                        
            mdContainer.addMetadata(firstMetadataRec);  //adding record container that will be used to deploy the records in custom metadata.                        
            //Second Record 
            Metadata.CustomMetadata secondMetadataRec =  new Metadata.CustomMetadata();
            secondMetadataRec.fullName = nameSpacePrefix + 'Bulk_Upload__mdt.SecondRec';
            secondMetadataRec.label = 'SecondRec';           
            //adding values to fields
            Metadata.CustomMetadataValue secondCustomField = new Metadata.CustomMetadataValue();
            secondCustomField.field = 'Is_Displayed__c';
            secondCustomField.value = True;
            secondMetadataRec.values.add(secondCustomField);            
            Metadata.CustomMetadataValue secondCustomField2 = new Metadata.CustomMetadataValue();
            secondCustomField2.field = 'NameType__c';
            secondCustomField2.value = 'Second';
            secondMetadataRec.values.add(secondCustomField2);           
            Metadata.CustomMetadataValue secondCustomField3 = new Metadata.CustomMetadataValue();
            secondCustomField3.field = 'RecName__c';
            secondCustomField3.value = 'Second RecordName';
            secondMetadataRec.values.add(secondCustomField3);               
            mdContainer.addMetadata(secondMetadataRec);            
            system.debug('mdContainer**'+mdContainer);            
            // Enqueue custom metadata deployment
            // jobId is the deployment ID
            Id jobId = Metadata.Operations.enqueueDeployment(mdContainer, null);
            system.debug('jobId***'+jobId);
  //      }
    //    catch(Exception ex){             
            //System.assert(false,ex.getMessage()); 
    //        system.debug('Error while creating modifying custom metadata.');
     //   }
    }
    /**
     *@desc: A method to bulk update the custom metadata records . 
     **/
    public void updateBulkMetadata(){
        try{
            Metadata.DeployContainer mdContainer = new Metadata.DeployContainer();
            for(Support_Tier__mdt objMetadata :[SELECT Id, DeveloperName,
                                           		  MasterLabel, Label
                                           FROM Support_Tier__mdt]){
                Metadata.CustomMetadata metadataRec =  new Metadata.CustomMetadata();
                metadataRec.fullName = 'Bulk_Upload__mdt.'+objMetadata.DeveloperName;
                metadataRec.label = objMetadata.MasterLabel;
                Metadata.CustomMetadataValue customFieldtoUpdate = new Metadata.CustomMetadataValue();
                customFieldtoUpdate.field = 'Is_Displayed__c';
                customFieldtoUpdate.value = false;
                metadataRec.values.add(customFieldtoUpdate);
                mdContainer.addMetadata(metadataRec);
            }
            system.debug('mdContainer**'+mdContainer);            
            // Enqueue custom metadata deployment
            // jobId is the deployment ID
            Id jobId = Metadata.Operations.enqueueDeployment(mdContainer, null);
            system.debug('jobId***'+jobId);                                   
        }catch(exception ex){
            system.debug('exception '+ex.getMessage());                                 
        }       
    }    
}