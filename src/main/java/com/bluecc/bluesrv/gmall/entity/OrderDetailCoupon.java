package com.bluecc.bluesrv.gmall.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.time.LocalDateTime;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * <p>
 * 订单明细购物券表
 * </p>
 *
 * @author samlet
 * @since 2021-10-23
 */
@TableName("order_detail_coupon")
@ApiModel(value = "OrderDetailCoupon对象", description = "订单明细购物券表")
public class OrderDetailCoupon implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("编号")
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    @ApiModelProperty("订单id")
    private Long orderId;

    @ApiModelProperty("订单明细id")
    private Long orderDetailId;

    @ApiModelProperty("购物券ID")
    private Long couponId;

    @ApiModelProperty("购物券领用id")
    private Long couponUseId;

    @ApiModelProperty("skuID")
    private Long skuId;

    @ApiModelProperty("获取时间")
    private LocalDateTime createTime;


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

    public Long getOrderDetailId() {
        return orderDetailId;
    }

    public void setOrderDetailId(Long orderDetailId) {
        this.orderDetailId = orderDetailId;
    }

    public Long getCouponId() {
        return couponId;
    }

    public void setCouponId(Long couponId) {
        this.couponId = couponId;
    }

    public Long getCouponUseId() {
        return couponUseId;
    }

    public void setCouponUseId(Long couponUseId) {
        this.couponUseId = couponUseId;
    }

    public Long getSkuId() {
        return skuId;
    }

    public void setSkuId(Long skuId) {
        this.skuId = skuId;
    }

    public LocalDateTime getCreateTime() {
        return createTime;
    }

    public void setCreateTime(LocalDateTime createTime) {
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        return "OrderDetailCoupon{" +
        "id=" + id +
        ", orderId=" + orderId +
        ", orderDetailId=" + orderDetailId +
        ", couponId=" + couponId +
        ", couponUseId=" + couponUseId +
        ", skuId=" + skuId +
        ", createTime=" + createTime +
        "}";
    }
}
