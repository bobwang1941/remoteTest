package com.domain;

/**
 * <p>
 * 
 * @author : zqwang
 *
 * @date : 2017年3月21日
 */
public class BuildType {
    
    /** 组件id */
    private long id;
    /** 构建类型(英文) */
    private String buildType;
    /** 构建类型(中文) */
    private String buildTypeDesc;
    
    
    /**
     * getter method 
     * @see BuildType#id
     * @return the id
     */
    public long getId() {
        return id;
    }
    /**
     * setter method
     * @see BuildType#id
     * @param id the id to set
     */
    public void setId(long id) {
        this.id = id;
    }
    /**
     * getter method 
     * @see BuildType#buildType
     * @return the buildType
     */
    public String getBuildType() {
        return buildType;
    }
    /**
     * setter method
     * @see BuildType#buildType
     * @param buildType the buildType to set
     */
    public void setBuildType(String buildType) {
        this.buildType = buildType;
    }
    /**
     * getter method 
     * @see BuildType#buildTypeDesc
     * @return the buildTypeDesc
     */
    public String getBuildTypeDesc() {
        return buildTypeDesc;
    }
    /**
     * setter method
     * @see BuildType#buildTypeDesc
     * @param buildTypeDesc the buildTypeDesc to set
     */
    public void setBuildTypeDesc(String buildTypeDesc) {
        this.buildTypeDesc = buildTypeDesc;
    }
    @Override
    public String toString() {
        return "BuildType [id=" + id + ", buildType=" + buildType + ", buildTypeDesc=" + buildTypeDesc + "]";
    }
   
  
    

}
