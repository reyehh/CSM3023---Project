
public class Payment {
    private String paymentID;
    private String staffID;
    private String parcelID;
    private double charge;
    private String typeOfCharge;

    // Constructors, getters, and setters
    public Payment() {
    }

    public Payment(String paymentID, String staffID, String parcelID, double charge, String typeOfCharge) {
        this.paymentID = paymentID;
        this.staffID = staffID;
        this.parcelID = parcelID;
        this.charge = charge;
        this.typeOfCharge = typeOfCharge;
    }

    public String getPaymentID() {
        return paymentID;
    }

    public void setPaymentID(String paymentID) {
        this.paymentID = paymentID;
    }

    public String getStaffID() {
        return staffID;
    }

    public void setStaffID(String staffID) {
        this.staffID = staffID;
    }

    public String getParcelID() {
        return parcelID;
    }

    public void setParcelID(String parcelID) {
        this.parcelID = parcelID;
    }

    public double getCharge() {
        return charge;
    }

    public void setCharge(double charge) {
        this.charge = charge;
    }

    public String getTypeOfCharge() {
        return typeOfCharge;
    }

    public void setTypeOfCharge(String typeOfCharge) {
        this.typeOfCharge = typeOfCharge;
    }
}
