import { LightningElement, api } from 'lwc';

export default class HdfcAgentforcePanel extends LightningElement {

    @api customerName;
    @api email;

    initialized = false;

   

    renderedCallback() {

        if (this.initialized) {
            return;
        }

        this.initialized = true;

        const script = document.createElement('script');

        script.src =
        'https://orgfarm-c6bc25c5c0-dev-ed.develop.my.site.com/ESWHDFCChannel1781603774042/assets/js/bootstrap.min.js';

        script.onload = () => {

            try {

                embeddedservice_bootstrap.settings.language =
                'en_US';

                embeddedservice_bootstrap.init(

                    '00DgL000000Bd4W',

                    'HDFC_Channel',

                    'https://orgfarm-c6bc25c5c0-dev-ed.develop.my.site.com/ESWHDFCChannel1781603774042',

                    {
                        scrt2URL:
                        'https://orgfarm-c6bc25c5c0-dev-ed.develop.my.salesforce-scrt.com'
                    }
                );

            } catch (e) {

                console.error(e);
            }
        };

        document.body.appendChild(script);
    }

   

    handleTrackCase() {

        console.log('Track Case');
    }

    handleAdvisor() {

        console.log('Talk To Advisor');
    }
}