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
@TableName("base_region")
@ApiModel(value = "BaseRegion对象", description = "")
public class BaseRegion implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("大区id")
    private String id;

    @ApiModelProperty("大区名称")
    private String regionName;


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getRegionName() {
        return regionName;
    }

    public void setRegionName(String regionName) {
        this.regionName = regionName;
    }

    @Override
    public String toString() {
        return "BaseRegion{" +
        "id=" + id +
        ", regionName=" + regionName +
        "}";
    }
}
