import OfflineTrialExpirationDate from '@salesforce/schema/User.OfflineTrialExpirationDate';
import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class TempComponent extends LightningElement {

   
    firstName = '';
    save()
    {
       // alert("hello " +  this.template.querySelector(`[data-id="site-id"]`).value);
      //alert("hello " +  this.template.querySelector(`[data-id="site-id"]`).value);
      alert("hello " +  this.template.querySelector(`[name="site-id"]`).value);
    }

    handleClick(event) {
        const field = event.target.name;
        alert("second hello  " +  field);
    }

    handleChange(event) {
        this.firstName = event.target.value;
    }

    NewSave(event)
    {
        const msj = new ShowToastEvent({
            title: 'Funciona!!',
            message:
                this.firstName,
            variant:'success'
        });
        this.dispatchEvent(msj);
    }
}