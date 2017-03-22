/*
 * Create Author  : chen.chen.9
 * Create Date    : Oct 15, 2014
 * File Name      : DeliveryStatus.java
 */

package com.domain;

/**
 * 交付状态信息
 * <p>
 * 
 * @author : chen.chen.9
 * @date : Oct 15, 2014
 */
public class DeliveryStatus {
    /** 主键 */
    private long id;

    /** 项目名 */
    private String projectname;

    /** 摘要 */
    private String summary;

    /** 交付唯一标识 */
    private String deliveryUuid;

    /** 构建ID，BUILD_SID */
    private String buildid;

    /** 构建版本，BUILD_VERSION */
    private String buildversion;

    /** 持续交付最后停在的阶段，如果成功则会运行完毕 */
    private String endedPhase;

    /** 花费的时间 */
    private long elapsedTime;

    /** 开始时间 */
    private long startTime;

    /** 持续集成是否结束 */
    private int end;

    /** 持续构建是否成功 */
    private int successInBuilding;

    /** 代码质量检查是否成功 */
    private int successInCodeQualityChecking;

    /** 持续交付是否成功 */
    private int successInDelivery;

    /** 持续部署是否成功 */
    private int successInDeploy;

    /** 是否成功 */
    private int success;

    /** 构建号，用来输出控制台链接 */
    private String buildnumber;

    /** 交付地址 */
    private String deliveryPath;

    /** 版本控制系统的版本号 */
    private String revision;

    /**
     * getter method
     * 
     * @see DeliveryStatus#id
     * @return the id
     */
    public long getId() {
        return id;
    }

    /**
     * setter method
     * 
     * @see DeliveryStatus#id
     * @param id
     *            the id to set
     */
    public void setId(long id) {
        this.id = id;
    }

    /**
     * getter method
     * 
     * @see DeliveryStatus#projectname
     * @return the projectname
     */
    public String getProjectname() {
        return projectname;
    }

    /**
     * setter method
     * 
     * @see DeliveryStatus#projectname
     * @param projectname
     *            the projectname to set
     */
    public void setProjectname(String projectname) {
        this.projectname = projectname;
    }

    /**
     * getter method
     * 
     * @see DeliveryStatus#summary
     * @return the summary
     */
    public String getSummary() {
        return summary;
    }

    /**
     * setter method
     * 
     * @see DeliveryStatus#summary
     * @param summary
     *            the summary to set
     */
    public void setSummary(String summary) {
        this.summary = summary;
    }

    /**
     * getter method
     * 
     * @see DeliveryStatus#deliveryUuid
     * @return the deliveryUuid
     */
    public String getDeliveryUuid() {
        return deliveryUuid;
    }

    /**
     * setter method
     * 
     * @see DeliveryStatus#deliveryUuid
     * @param deliveryUuid
     *            the deliveryUuid to set
     */
    public void setDeliveryUuid(String deliveryUuid) {
        this.deliveryUuid = deliveryUuid;
    }

    /**
     * getter method
     * 
     * @see DeliveryStatus#buildid
     * @return the buildid
     */
    public String getBuildid() {
        return buildid;
    }

    /**
     * setter method
     * 
     * @see DeliveryStatus#buildid
     * @param buildid
     *            the buildid to set
     */
    public void setBuildid(String buildid) {
        this.buildid = buildid;
    }

    /**
     * getter method
     * 
     * @see DeliveryStatus#buildversion
     * @return the buildversion
     */
    public String getBuildversion() {
        return buildversion;
    }

    /**
     * setter method
     * 
     * @see DeliveryStatus#buildversion
     * @param buildversion
     *            the buildversion to set
     */
    public void setBuildversion(String buildversion) {
        this.buildversion = buildversion;
    }

    /**
     * getter method
     * 
     * @see DeliveryStatus#endedPhase
     * @return the endedPhase
     */
    public String getEndedPhase() {
        return endedPhase;
    }

    /**
     * setter method
     * 
     * @see DeliveryStatus#endedPhase
     * @param endedPhase
     *            the endedPhase to set
     */
    public void setEndedPhase(String endedPhase) {
        this.endedPhase = endedPhase;
    }

    /**
     * getter method
     * 
     * @see DeliveryStatus#elapsedTime
     * @return the elapsedTime
     */
    public long getElapsedTime() {
        return elapsedTime;
    }

    /**
     * setter method
     * 
     * @see DeliveryStatus#elapsedTime
     * @param elapsedTime
     *            the elapsedTime to set
     */
    public void setElapsedTime(long elapsedTime) {
        this.elapsedTime = elapsedTime;
    }

    /**
     * getter method
     * 
     * @see DeliveryStatus#startTime
     * @return the startTime
     */
    public long getStartTime() {
        return startTime;
    }

    /**
     * setter method
     * 
     * @see DeliveryStatus#startTime
     * @param startTime
     *            the startTime to set
     */
    public void setStartTime(long startTime) {
        this.startTime = startTime;
    }

    /**
     * getter method
     * 
     * @see DeliveryStatus#successInBuilding
     * @return the successInBuilding
     */
    public int getSuccessInBuilding() {
        return successInBuilding;
    }

    /**
     * setter method
     * 
     * @see DeliveryStatus#successInBuilding
     * @param successInBuilding
     *            the successInBuilding to set
     */
    public void setSuccessInBuilding(int successInBuilding) {
        this.successInBuilding = successInBuilding;
    }

    /**
     * getter method
     * 
     * @see DeliveryStatus#successInCodeQualityChecking
     * @return the successInCodeQualityChecking
     */
    public int getSuccessInCodeQualityChecking() {
        return successInCodeQualityChecking;
    }

    /**
     * setter method
     * 
     * @see DeliveryStatus#successInCodeQualityChecking
     * @param successInCodeQualityChecking
     *            the successInCodeQualityChecking to set
     */
    public void setSuccessInCodeQualityChecking(int successInCodeQualityChecking) {
        this.successInCodeQualityChecking = successInCodeQualityChecking;
    }

    /**
     * getter method
     * 
     * @see DeliveryStatus#successInDelivery
     * @return the successInDelivery
     */
    public int getSuccessInDelivery() {
        return successInDelivery;
    }

    /**
     * setter method
     * 
     * @see DeliveryStatus#successInDelivery
     * @param successInDelivery
     *            the successInDelivery to set
     */
    public void setSuccessInDelivery(int successInDelivery) {
        this.successInDelivery = successInDelivery;
    }

    /**
     * getter method
     * 
     * @see DeliveryStatus#success
     * @return the success
     */
    public int getSuccess() {
        return success;
    }

    /**
     * setter method
     * 
     * @see DeliveryStatus#success
     * @param success
     *            the success to set
     */
    public void setSuccess(int success) {
        this.success = success;
    }

    @Override
    public String toString() {
        return "DeliveryStatus [id=" + id + ", projectname=" + projectname + ", summary=" + summary + ", deliveryUuid=" + deliveryUuid + ", buildid=" + buildid + ", buildversion="
               + buildversion + ", endedPhase=" + endedPhase + ", elapsedTime=" + elapsedTime + ", startTime=" + startTime + ", end=" + end + ", successInBuilding="
               + successInBuilding + ", successInCodeQualityChecking=" + successInCodeQualityChecking + ", successInDelivery=" + successInDelivery + ", success=" + success
               + ", buildnumber=" + buildnumber + ", deliveryPath=" + deliveryPath + ", revision=" + revision + "]";
    }

    /**
     * getter method
     * 
     * @see DeliveryStatus#end
     * @return the end
     */
    public int getEnd() {
        return end;
    }

    /**
     * setter method
     * 
     * @see DeliveryStatus#end
     * @param end
     *            the end to set
     */
    public void setEnd(int end) {
        this.end = end;
    }

    /**
     * getter method
     * 
     * @see DeliveryStatus#buildnumber
     * @return the buildnumber
     */
    public String getBuildnumber() {
        return buildnumber;
    }

    /**
     * setter method
     * 
     * @see DeliveryStatus#buildnumber
     * @param buildnumber
     *            the buildnumber to set
     */
    public void setBuildnumber(String buildnumber) {
        this.buildnumber = buildnumber;
    }

    /**
     * getter method
     * 
     * @see DeliveryStatus#deliveryPath
     * @return the deliveryPath
     */
    public String getDeliveryPath() {
        return deliveryPath;
    }

    /**
     * setter method
     * 
     * @see DeliveryStatus#deliveryPath
     * @param deliveryPath
     *            the deliveryPath to set
     */
    public void setDeliveryPath(String deliveryPath) {
        this.deliveryPath = deliveryPath;
    }

    /**
     * getter method
     * 
     * @see DeliveryStatus#revision
     * @return the revision
     */
    public String getRevision() {
        return revision;
    }

    /**
     * setter method
     * 
     * @see DeliveryStatus#revision
     * @param revision
     *            the revision to set
     */
    public void setRevision(String revision) {
        this.revision = revision;
    }

    /**
     * getter method
     * 
     * @see DeliveryStatus#successInDeploy
     * @return the successInDeploy
     */
    public int getSuccessInDeploy() {
        return successInDeploy;
    }

    /**
     * setter method
     * 
     * @see DeliveryStatus#successInDeploy
     * @param successInDeploy
     *            the successInDeploy to set
     */
    public void setSuccessInDeploy(int successInDeploy) {
        this.successInDeploy = successInDeploy;
    }

}
