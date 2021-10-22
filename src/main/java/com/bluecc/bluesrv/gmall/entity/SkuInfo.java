package com.bluecc.bluesrv.gmall.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * <p>
 * 库存单元表
 * </p>
 *
 * @author samlet
 * @since 2021-10-23
 */
@TableName("sku_info")
@ApiModel(value = "SkuInfo对象", description = "库存单元表")
public class SkuInfo implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("库存id(itemID)")
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    @ApiModelProperty("商品id")
    private Long spuId;

    @ApiModelProperty("价格")
    private BigDecimal price;

    @ApiModelProperty("sku名称")
    private String skuName;

    @ApiModelProperty("商品规格描述")
    private String skuDesc;

    @ApiModelProperty("重量")
    private BigDecimal weight;

    @ApiModelProperty("品牌(冗余)")
    private Long tmId;

    @ApiModelProperty("三级分类id（冗余)")
    private Long category3Id;

    @ApiModelProperty("默认显示图片(冗余)")
    private String skuDefaultImg;

    @ApiModelProperty("是否销售（1：是 0：否）")
    private Integer isSale;

    @ApiModelProperty("创建时间")
    private LocalDateTime createTime;


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

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getSkuName() {
        return skuName;
    }

    public void setSkuName(String skuName) {
        this.skuName = skuName;
    }

    public String getSkuDesc() {
        return skuDesc;
    }

    public void setSkuDesc(String skuDesc) {
        this.skuDesc = skuDesc;
    }

    public BigDecimal getWeight() {
        return weight;
    }

    public void setWeight(BigDecimal weight) {
        this.weight = weight;
    }

    public Long getTmId() {
        return tmId;
    }

    public void setTmId(Long tmId) {
        this.tmId = tmId;
    }

    public Long getCategory3Id() {
        return category3Id;
    }

    public void setCategory3Id(Long category3Id) {
        this.category3Id = category3Id;
    }

    public String getSkuDefaultImg() {
        return skuDefaultImg;
    }

    public void setSkuDefaultImg(String skuDefaultImg) {
        this.skuDefaultImg = skuDefaultImg;
    }

    public Integer getIsSale() {
        return isSale;
    }

    public void setIsSale(Integer isSale) {
        this.isSale = isSale;
    }

    public LocalDateTime getCreateTime() {
        return createTime;
    }

    public void setCreateTime(LocalDateTime createTime) {
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        return "SkuInfo{" +
        "id=" + id +
        ", spuId=" + spuId +
        ", price=" + price +
        ", skuName=" + skuName +
        ", skuDesc=" + skuDesc +
        ", weight=" + weight +
        ", tmId=" + tmId +
        ", category3Id=" + category3Id +
        ", skuDefaultImg=" + skuDefaultImg +
        ", isSale=" + isSale +
        ", createTime=" + createTime +
        "}";
    }
}
