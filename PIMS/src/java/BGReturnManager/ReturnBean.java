/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package BGReturnManager;

/**
 *
 * @author Administrator
 */
public class ReturnBean {
    private String ServiceId;
    private String OrderId;
    private String RequestDate;
    private String Username;
    private String ReturnMoney;
    private String ServiceStatus;
    private String ServiceDate;
    private String ReturnDescribe;
    private String ServiceRemark;

    public ReturnBean() {
    }

    public String getServiceId() {
        return ServiceId;
    }

    public void setServiceId(String serviceId) {
        ServiceId = serviceId;
    }

    public String getOrderId() {
        return OrderId;
    }

    public void setOrderId(String orderId) {
        OrderId = orderId;
    }

    public String getRequestDate() {
        return RequestDate;
    }

    public void setRequestDate(String requestDate) {
        RequestDate = requestDate;
    }

    public String getUsername() {
        return Username;
    }

    public void setUsername(String username) {
        Username = username;
    }

    public String getReturnMoney() {
        return ReturnMoney;
    }

    public void setReturnMoney(String returnMoney) {
        ReturnMoney = returnMoney;
    }

    public String getServiceStatus() {
        return ServiceStatus;
    }

    public void setServiceStatus(String serviceStatus) {
        ServiceStatus = serviceStatus;
    }

    public String getServiceDate() {
        return ServiceDate;
    }

    public void setServiceDate(String serviceDate) {
        ServiceDate = serviceDate;
    }

    public String getReturnDescribe() {
        return ReturnDescribe;
    }

    public void setReturnDescribe(String returnDescribe) {
        ReturnDescribe = returnDescribe;
    }

    public String getServiceRemark() {
        return ServiceRemark;
    }

    public void setServiceRemark(String serviceRemark) {
        ServiceRemark = serviceRemark;
    }
}
