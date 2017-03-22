package com.domain;


public class Response {
    
    private boolean success;
    
    private String errorMessage;
    
    private String admin;
    
    private Object data;

    /**
     * getter method 
     * @see Response#success
     * @return the success
     */
    public boolean isSuccess() {
        return success;
    }

    /**
     * setter method
     * @see Response#success
     * @param success the success to set
     */
    public void setSuccess(boolean success) {
        this.success = success;
    }

    /**
     * getter method 
     * @see Response#errorMessage
     * @return the errorMessage
     */
    public String getErrorMessage() {
        return errorMessage;
    }

    /**
     * setter method
     * @see Response#errorMessage
     * @param errorMessage the errorMessage to set
     */
    public void setErrorMessage(String errorMessage) {
        this.errorMessage = errorMessage;
    }

    /**
     * getter method 
     * @see Response#admin
     * @return the admin
     */
    public String getAdmin() {
        return admin;
    }

    /**
     * setter method
     * @see Response#admin
     * @param admin the admin to set
     */
    public void setAdmin(String admin) {
        this.admin = admin;
    }

    /**
     * getter method 
     * @see Response#data
     * @return the data
     */
    public Object getData() {
        return data;
    }

    /**
     * setter method
     * @see Response#data
     * @param data the data to set
     */
    public void setData(Object data) {
        this.data = data;
    }

    @Override
    public String toString() {
        return "Response [success=" + success + ", errorMessage=" + errorMessage + ", admin=" + admin + ", data=" + data + "]";
    }
    
    
    

}
