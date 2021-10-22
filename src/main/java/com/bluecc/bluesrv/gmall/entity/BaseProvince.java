package com.bluecc.bluesrv.gmall.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * <p>
 * 
 * </p>
 *
 * @author samlet
 * @since 2021-10-23
 */
@TableName("base_province")
@ApiModel(value = "BaseProvince对象", description = "")
public class BaseProvince implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("id")
    private Long id;

    @ApiModelProperty("省名称")
    private String name;

    @ApiModelProperty("大区id")
    private String regionId;

    @ApiModelProperty("行政区位码")
    private String areaCode;

    @ApiModelProperty("国际编码")
    private String isoCode;

    @ApiModelProperty("ISO3166编码")
    private String iso31662;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRegionId() {
        return regionId;
    }

    public void setRegionId(String regionId) {
        this.regionId = regionId;
    }

    public String getAreaCode() {
        return areaCode;
    }

    public void setAreaCode(String areaCode) {
        this.areaCode = areaCode;
    }

    public String getIsoCode() {
        return isoCode;
    }

    public void setIsoCode(String isoCode) {
        this.isoCode = isoCode;
    }

    public String getIso31662() {
        return iso31662;
    }

    public void setIso31662(String iso31662) {
        this.iso31662 = iso31662;
    }

    @Override
    public String toString() {
        return "BaseProvince{" +
        "id=" + id +
        ", name=" + name +
        ", regionId=" + regionId +
        ", areaCode=" + areaCode +
        ", isoCode=" + isoCode +
        ", iso31662=" + iso31662 +
        "}";
    }
}
