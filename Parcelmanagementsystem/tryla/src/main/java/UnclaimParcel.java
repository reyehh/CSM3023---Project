public class UnclaimParcel {
    protected int batchID;
    protected String parcelNo;
    protected String parcelID;
    protected String studID;
    
    public UnclaimParcel(){}
    
    public UnclaimParcel (String parcelNo, String parcelID, String studID){
        super();
        this.parcelNo = parcelNo;
        this.parcelID = parcelID;
        this.studID = studID;
    }
    
    public UnclaimParcel (int batchID, String parcelNo, String parcelID, String studID){
        super();
        this.batchID = batchID;
        this.parcelNo = parcelNo;
        this.parcelID = parcelID;
        this.studID = studID;
}

    public int getBatchID() {
        return batchID;
    }

    public void setBatchID(int batchID) {
        this.batchID = batchID;
    }

    public String getParcelNo() {
        return parcelNo;
    }

    public void setParcelNo(String parcelNo) {
        this.parcelNo = parcelNo;
    }

    public String getParcelID() {
        return parcelID;
    }

    public void setParcelID(String parcelID) {
        this.parcelID = parcelID;
    }

    public String getStudID() {
        return studID;
    }

    public void setStudID(String studID) {
        this.studID = studID;
    }
}