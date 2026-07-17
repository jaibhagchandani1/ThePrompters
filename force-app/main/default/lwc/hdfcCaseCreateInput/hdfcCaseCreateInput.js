import { LightningElement, api } from 'lwc';

export default class HdfcCaseCreateInput extends LightningElement {

    @api readOnly = false;

    subject = '';
    priority = '';
    description = '';

    _value;

    @api
    get value() {
        return this._value;
    }

    set value(value) {

        this._value = value;

        if(value){

            this.subject = value.subject || '';
            this.priority = value.priority || '';
            this.description = value.description || '';
        }
    }

    get priorityOptions(){

        return [
            {
                label:'Low',
                value:'Low'
            },
            {
                label:'Medium',
                value:'Medium'
            },
            {
                label:'High',
                value:'High'
            }
        ];
    }

    handleSubject(event){

        this.subject = event.target.value;

        this.publishValue();
    }

    handlePriority(event){

        this.priority = event.detail.value;

        this.publishValue();
    }

    handleDescription(event){

        this.description = event.target.value;

        this.publishValue();
    }

    publishValue(){

        this.dispatchEvent(
            new CustomEvent(
                'valuechange',
                {
                    detail:{
                        value:{
                            subject:this.subject,
                            priority:this.priority,
                            description:this.description
                        }
                    }
                }
            )
        );
    }
}