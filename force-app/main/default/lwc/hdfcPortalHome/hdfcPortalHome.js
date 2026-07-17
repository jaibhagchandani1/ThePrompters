import { LightningElement } from 'lwc';

import getCustomerDashboard
from '@salesforce/apex/HDFCCustomerPortalController.getCustomerDashboard';

export default class HdfcPortalHome extends LightningElement {

    customerName;
    email;
    cases = [];
    openCaseCount = 0;

    connectedCallback(){

        window.addEventListener(
            'userInfo',
            this.handleUserInfo.bind(this)
        );
    }

    handleUserInfo(event){

        this.email =
            event.detail.email;

        console.log(
            'EMAIL',
            event.detail.email
        );

        getCustomerDashboard({

            email : this.email

        }).then(result => {

            this.customerName =
                result.customerName;

            this.cases =
                result.caseWrappers;
            
            this.openCaseCount = this.cases.length;

            console.log(
                'Cases',
                this.cases
            );
            console.log(
                'Cases Returned',
                result.caseWrappers.length
            );

        }).catch(error => {

            console.error(error);
        });
    }
}