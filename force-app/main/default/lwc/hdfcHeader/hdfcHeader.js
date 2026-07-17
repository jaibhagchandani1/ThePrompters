import { LightningElement, api } from 'lwc';
import HDFCLifeLogo from '@salesforce/resourceUrl/HDFCLifeLogo';

export default class HdfcHeader extends LightningElement {

    @api customerName;

    logoUrl = HDFCLifeLogo;

    get initials(){

        if(!this.customerName){
            return 'CU';
        }

        return this.customerName
            .split(' ')
            .map(item => item.charAt(0))
            .join('')
            .substring(0,2)
            .toUpperCase();
    }
}