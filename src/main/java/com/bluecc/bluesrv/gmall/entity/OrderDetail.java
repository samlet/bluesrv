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
 * 订单明细表
 * </p>
 *
 * @author samlet
 * @since 2021-10-23
 */
@TableName("order_detail")
@ApiModel(value = "OrderDetail对象", description = "订单明细表")
public class OrderDetail implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("编号")
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    @ApiModelProperty("订单编号")
    private Long orderId;

    @ApiModelProperty("sku_id")
    private Long skuId;

    @ApiModelProperty("sku名称（冗余)")
    private String skuName;

    @ApiModelProperty("图片名称（冗余)")
    private String imgUrl;

    @ApiModelProperty("购买价格(下单时sku价格）")
    private BigDecimal orderPrice;

    @ApiModelProperty("购买个数")
    private String skuNum;

    @ApiModelProperty("创建时间")
    private LocalDateTime createTime;

    @ApiModelProperty("来源类型")
    private String sourceType;

    @ApiModelProperty("来源编号")
    private Long sourceId;

    private BigDecimal splitTotalAmount;

    private BigDecimal splitActivityAmount;

    private BigDecimal splitCouponAmount;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getOrderId() {
        return orderId;
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }

    public Long getSkuId() {
        return skuId;
    }

    public void setSkuId(Long skuId) {
        this.skuId = skuId;
    }

    public String getSkuName() {
        return skuName;
    }

    public void setSkuName(String skuName) {
        this.skuName = skuName;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public BigDecimal getOrderPrice() {
        return orderPrice;
    }

    public void setOrderPrice(BigDecimal orderPrice) {
        this.orderPrice = orderPrice;
    }

    public String getSkuNum() {
        return skuNum;
    }

    public void setSkuNum(String skuNum) {
        this.skuNum = skuNum;
    }

    public LocalDateTime getCreateTime() {
        return createTime;
    }

    public void setCreateTime(LocalDateTime createTime) {
        this.createTime = createTime;
    }

    public String getSourceType() {
        return sourceType;
    }

    public void setSourceType(String sourceType) {
        this.sourceType = sourceType;
    }

    public Long getSourceId() {
        return sourceId;
    }

    public void setSourceId(Long sourceId) {
        this.sourceId = sourceId;
    }

    public BigDecimal getSplitTotalAmount() {
        return splitTotalAmount;
    }

    public void setSplitTotalAmount(BigDecimal splitTotalAmount) {
        this.splitTotalAmount = splitTotalAmount;
    }

    public BigDecimal getSplitActivityAmount() {
        return splitActivityAmount;
    }

    public void setSplitActivityAmount(BigDecimal splitActivityAmount) {
        this.splitActivityAmount = splitActivityAmount;
    }

    public BigDecimal getSplitCouponAmount() {
        return splitCouponAmount;
    }

    public void setSplitCouponAmount(BigDecimal splitCouponAmount) {
        this.splitCouponAmount = splitCouponAmount;
    }

    @Override
    public String toString() {
        return "OrderDetail{" +
        "id=" + id +
        ", orderId=" + orderId +
        ", skuId=" + skuId +
        ", skuName=" + skuName +
        ", imgUrl=" + imgUrl +
        ", orderPrice=" + orderPrice +
        ", skuNum=" + skuNum +
        ", createTime=" + createTime +
        ", sourceType=" + sourceType +
        ", sourceId=" + sourceId +
        ", splitTotalAmount=" + splitTotalAmount +
        ", splitActivityAmount=" + splitActivityAmount +
        ", splitCouponAmount=" + splitCouponAmount +
        "}";
    }
}
