import { LightningElement, api } from 'lwc';

export default class HdfcOpenCases extends LightningElement {

    @api cases;

    handleCreateCase(){

        this.dispatchEvent(
            new CustomEvent(
                'createcase'
            )
        );
    }
}