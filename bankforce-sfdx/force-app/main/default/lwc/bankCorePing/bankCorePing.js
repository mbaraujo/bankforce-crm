import { LightningElement, track } from 'lwc';
import ping from '@salesforce/apex/BankCorePingController.ping';

export default class BankCorePing extends LightningElement {
    @track message;
    @track error;

    async handlePing() {
        this.message = null;
        this.error = null;

        try {
            const result = await ping();
            this.message = result;
        } catch (e) {
            
            this.error =
                (e && e.body && e.body.message) ? e.body.message :
                (e && e.message) ? e.message :
                'Unexpected error';
        }
    }
}