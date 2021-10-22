package com.bluecc.bluesrv.gmall.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * <p>
 * sku销售属性值
 * </p>
 *
 * @author samlet
 * @since 2021-10-23
 */
@TableName("sku_sale_attr_value")
@ApiModel(value = "SkuSaleAttrValue对象", description = "sku销售属性值")
public class SkuSaleAttrValue implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("id")
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    @ApiModelProperty("库存单元id")
    private Long skuId;

    @ApiModelProperty("spu_id(冗余)")
    private Integer spuId;

    @ApiModelProperty("销售属性值id")
    private Long saleAttrValueId;

    private Long saleAttrId;

    private String saleAttrName;

    private String saleAttrValueName;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getSkuId() {
        return skuId;
    }

    public void setSkuId(Long skuId) {
        this.skuId = skuId;
    }

    public Integer getSpuId() {
        return spuId;
    }

    public void setSpuId(Integer spuId) {
        this.spuId = spuId;
    }

    public Long getSaleAttrValueId() {
        return saleAttrValueId;
    }

    public void setSaleAttrValueId(Long saleAttrValueId) {
        this.saleAttrValueId = saleAttrValueId;
    }

    public Long getSaleAttrId() {
        return saleAttrId;
    }

    public void setSaleAttrId(Long saleAttrId) {
        this.saleAttrId = saleAttrId;
    }

    public String getSaleAttrName() {
        return saleAttrName;
    }

    public void setSaleAttrName(String saleAttrName) {
        this.saleAttrName = saleAttrName;
    }

    public String getSaleAttrValueName() {
        return saleAttrValueName;
    }

    public void setSaleAttrValueName(String saleAttrValueName) {
        this.saleAttrValueName = saleAttrValueName;
    }

    @Override
    public String toString() {
        return "SkuSaleAttrValue{" +
        "id=" + id +
        ", skuId=" + skuId +
        ", spuId=" + spuId +
        ", saleAttrValueId=" + saleAttrValueId +
        ", saleAttrId=" + saleAttrId +
        ", saleAttrName=" + saleAttrName +
        ", saleAttrValueName=" + saleAttrValueName +
        "}";
    }
}
