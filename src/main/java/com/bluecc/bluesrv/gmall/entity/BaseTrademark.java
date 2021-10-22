package com.bluecc.bluesrv.gmall.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * <p>
 * 品牌表
 * </p>
 *
 * @author samlet
 * @since 2021-10-23
 */
@TableName("base_trademark")
@ApiModel(value = "BaseTrademark对象", description = "品牌表")
public class BaseTrademark implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("编号")
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    @ApiModelProperty("属性值")
    private String tmName;

    @ApiModelProperty("品牌logo的图片路径")
    private String logoUrl;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTmName() {
        return tmName;
    }

    public void setTmName(String tmName) {
        this.tmName = tmName;
    }

    public String getLogoUrl() {
        return logoUrl;
    }

    public void setLogoUrl(String logoUrl) {
        this.logoUrl = logoUrl;
    }

    @Override
    public String toString() {
        return "BaseTrademark{" +
        "id=" + id +
        ", tmName=" + tmName +
        ", logoUrl=" + logoUrl +
        "}";
    }
}
