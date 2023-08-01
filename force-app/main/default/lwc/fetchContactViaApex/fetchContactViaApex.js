import { LightningElement } from 'lwc';
import getAllContacts from '@salesforce/apex/ContactManager.getContact'

export default class FetchContactViaApex extends LightningElement {

    numberOfRecords=0;
    contacts;
    email;
//@wire(getAllContacts)contacts;

    get responseReceived()
    {
        if(this.contacts){
            return true;
        }

        return false;

    }

    numberOfContactChangeHandler(event){
        //this.numberOfRecords =  event.target.value;
        this.email = event.target.value;
    }

    getContacts(){
        getAllContacts({email:this.email}).then(response=> {this.contacts = response;})
        .catch(error=>{console.log('Error in retrieven contact records', error.body.message)})
    }
}