package com.bluecc.bluesrv.gmall.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * <p>
 * sku平台属性值关联表
 * </p>
 *
 * @author samlet
 * @since 2021-10-23
 */
@TableName("sku_attr_value")
@ApiModel(value = "SkuAttrValue对象", description = "sku平台属性值关联表")
public class SkuAttrValue implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("编号")
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    @ApiModelProperty("属性id（冗余)")
    private Long attrId;

    @ApiModelProperty("属性值id")
    private Long valueId;

    @ApiModelProperty("skuid")
    private Long skuId;

    @ApiModelProperty("属性名")
    private String attrName;

    @ApiModelProperty("属性值名称")
    private String valueName;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getAttrId() {
        return attrId;
    }

    public void setAttrId(Long attrId) {
        this.attrId = attrId;
    }

    public Long getValueId() {
        return valueId;
    }

    public void setValueId(Long valueId) {
        this.valueId = valueId;
    }

    public Long getSkuId() {
        return skuId;
    }

    public void setSkuId(Long skuId) {
        this.skuId = skuId;
    }

    public String getAttrName() {
        return attrName;
    }

    public void setAttrName(String attrName) {
        this.attrName = attrName;
    }

    public String getValueName() {
        return valueName;
    }

    public void setValueName(String valueName) {
        this.valueName = valueName;
    }

    @Override
    public String toString() {
        return "SkuAttrValue{" +
        "id=" + id +
        ", attrId=" + attrId +
        ", valueId=" + valueId +
        ", skuId=" + skuId +
        ", attrName=" + attrName +
        ", valueName=" + valueName +
        "}";
    }
}
