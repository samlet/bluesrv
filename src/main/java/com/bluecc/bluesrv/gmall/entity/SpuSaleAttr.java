package com.bluecc.bluesrv.gmall.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * <p>
 * spu销售属性
 * </p>
 *
 * @author samlet
 * @since 2021-10-23
 */
@TableName("spu_sale_attr")
@ApiModel(value = "SpuSaleAttr对象", description = "spu销售属性")
public class SpuSaleAttr implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("编号(业务中无关联)")
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    @ApiModelProperty("商品id")
    private Long spuId;

    @ApiModelProperty("销售属性id")
    private Long baseSaleAttrId;

    @ApiModelProperty("销售属性名称(冗余)")
    private String saleAttrName;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getSpuId() {
        return spuId;
    }

    public void setSpuId(Long spuId) {
        this.spuId = spuId;
    }

    public Long getBaseSaleAttrId() {
        return baseSaleAttrId;
    }

    public void setBaseSaleAttrId(Long baseSaleAttrId) {
        this.baseSaleAttrId = baseSaleAttrId;
    }

    public String getSaleAttrName() {
        return saleAttrName;
    }

    public void setSaleAttrName(String saleAttrName) {
        this.saleAttrName = saleAttrName;
    }

    @Override
    public String toString() {
        return "SpuSaleAttr{" +
        "id=" + id +
        ", spuId=" + spuId +
        ", baseSaleAttrId=" + baseSaleAttrId +
        ", saleAttrName=" + saleAttrName +
        "}";
    }
}
