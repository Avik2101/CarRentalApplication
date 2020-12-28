import { LightningElement, api, wire, track } from "lwc";
import getCars from "@salesforce/apex/CarSearchResultController.getCars";
import { ShowToastEvent } from "lightning/platformShowToastEvent";

export default class CarSearchResult extends LightningElement {
    @api carTypeId;
    @track carsList;

    get carsFound() {
        if (this.carsList) return true;
        else false;
    }

    @wire(getCars, { carTypeId: "$carTypeId" })
    wiredCars({ data, error }) {
        if (data) {
            this.carsList = data;
        } else if (error) {
            this.showToast("ERROR", error.body.message, "error");
        }
    }

    showToast(title, message, variant) {
        const event = new ShowToastEvent({
            title: title,
            message: message,
            variant: variant
        });
        this.dispatchEvent(event);
    }
}
