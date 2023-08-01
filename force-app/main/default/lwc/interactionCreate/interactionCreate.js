import { LightningElement ,api,
    wire,
    track  } from 'lwc';
import InsertInteractions from '@salesforce/apex/InteractionController.makePostCallout';
export default class InteractionCreate extends LightningElement {

/*firstName =  this.template.querySelector(`[name="firstName"]`).value;
lastName =  this.template.querySelector(`[name="lastName"]`).value;
address =  this.template.querySelector(`[name="address"]`).value;
email = this.template.querySelector(`[name="email"]`).value;*/

/*save()
    {
       // alert("hello " +  this.template.querySelector(`[data-id="site-id"]`).value);
      //alert("hello " +  this.template.querySelector(`[data-id="site-id"]`).value);
      alert("hello " +  this.template.querySelector(`[name="site-id"]`).value);
    }*/
    handle_Submit(event)
    {
        
       
        InsertInteractions()
                .then((result) => {
                    alert("Mensaje"  + result );
                })
                .catch((error) => {
                    alert(error);
                });
                
               
    }

}