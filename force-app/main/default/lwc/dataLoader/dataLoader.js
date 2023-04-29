import { LightningElement,api,wire,track } from 'lwc';
import getObjects from '@salesforce/apex/DataLoader.getObjList';
import getObjectFields from '@salesforce/apex/DataLoader.getObjectFields';
import getData from '@salesforce/apex/DataLoader.Exportdata';
import myResource from '@salesforce/resourceUrl/DataLoaderbackground';
import SalesforceImage from '@salesforce/resourceUrl/Salesforce';


export default class DataLoader extends LightningElement {

    @track objects;
    @track objectstoshow;
    @track fields;
    @track fieldstoshow;
    @track ishideNext = true;
    @track ishideprevious = true;
    @track isPopup = false;
    @track isObjectPage = true;
    @track isQueryPage = false;
    @track selectedObject = '';
    @track query = '';
    backgroundimage = myResource;
    salesforceicon = SalesforceImage;

    Export(){
        this.isPopup = true;     
    }

    closeModal(){
        this.isPopup = false;
        this.ishideNext = true;
        this.ishideprevious = true;
        this.isObjectPage = true;
        this.isQueryPage = false;
        this.selectedObject = '';
        this.query = '';

    }
    
    @wire(getObjects)
    wiredObjectInformation({error,data}){
        if(data){
            this.objects = [];
            this.objectstoshow = [];
            for(var i = 0; i < data.length; i++){
                this.objects.push({Name : data[i]});
            } 
            this.objectstoshow =   this.objects;       
        }else if(error){          
            console.log('@@@@@@@@@@@error'+JSON.stringify(error));
        }
    }

    SearchObject(event){
       this.selectedObject = event.detail.value;
       this.objectstoshow = [];
       for(var i =0; i<this.objects.length; i++){
          var name = this.objects[i].Name;
          if(name.toUpperCase().includes(this.selectedObject.toUpperCase())){
              this.objectstoshow.push({Name : name});
          }
       }
       this.ishideNext = true;
    }
    handleSelectObject(event){
        var obj = event.target.value;
        this.selectedObject = obj.substring(obj.lastIndexOf("(") + 1, obj.lastIndexOf(")"));
        this.ishideNext = false;
    }

    Next(){
        this.ishideNext = true;
        this.ishideprevious = false;
        getObjectFields({selectedObj:this.selectedObject})
        .then(result =>{
            this.isObjectPage = false;
            this.isQueryPage = true;
            this.fields = [];
            for(var i = 0; i< result.length; i++){
                this.fields.push({Selected : false, Name:result[i]});
            }
        })
        .catch(error =>{

        })
        
    }

    handleSelectedField(event){
        console.log('@@@@@@@@@'+event.target.checked);
        if(event.target.checked){
          if(this.query == ''){
            this.query = 'Select ' +event.target.name+ ' from ' + this.selectedObject;
          }else{
            this.query = this.query.replace(' from',','+event.target.name+' from');
          }
        }else{
            if(this.query.includes(','+event.target.name)){
                this.query = this.query.replace(','+event.target.name,'');
            }else if(this.query.includes(event.target.name + ',','')){
                this.query = this.query.replace(event.target.name + ',','');
            }else{
                this.query = '';
            }
        }
    }

    ExportData(){
        getData({query:this.query})
        .then(result =>{
            
        })
        .catch(error =>{

        })
    }

    Previous(){

    }

   

    
    
}