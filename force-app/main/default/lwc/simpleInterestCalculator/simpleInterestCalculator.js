import { LightningElement } from 'lwc';

export default class SimpleInterestCalculator extends LightningElement {
    currentOutPut = 0;  
    principal;
    rateOfInterest;
    noOfYears; 

    principalChangeHandler(event)
    {
        this.principal = parseInt(event.target.value)
    }

    timeChangeHandler(event)
    {
        this.noOfYears = parseInt(event.target.value)
    }

    rateChangeHandler(event)
    {
        this.rateOfInterest = parseInt(event.target.value)
    }

    calculateSIHandler()
    {
        this.currentOutPut = 'Simple Interes is :'  + (this.principal * this.rateOfInterest * this.noOfYears)/100;
    }

}