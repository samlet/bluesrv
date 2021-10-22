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
 * 优惠券领用表
 * </p>
 *
 * @author samlet
 * @since 2021-10-23
 */
@TableName("coupon_use")
@ApiModel(value = "CouponUse对象", description = "优惠券领用表")
public class CouponUse implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("编号")
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    @ApiModelProperty("购物券ID")
    private Long couponId;

    @ApiModelProperty("用户ID")
    private Long userId;

    @ApiModelProperty("订单ID")
    private Long orderId;

    @ApiModelProperty("购物券状态（1：未使用 2：已使用）")
    private String couponStatus;

    @ApiModelProperty("获取时间")
    private LocalDateTime getTime;

    @ApiModelProperty("使用时间")
    private LocalDateTime usingTime;

    @ApiModelProperty("支付时间")
    private LocalDateTime usedTime;

    @ApiModelProperty("过期时间")
    private LocalDateTime expireTime;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getCouponId() {
        return couponId;
    }

    public void setCouponId(Long couponId) {
        this.couponId = couponId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getOrderId() {
        return orderId;
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }

    public String getCouponStatus() {
        return couponStatus;
    }

    public void setCouponStatus(String couponStatus) {
        this.couponStatus = couponStatus;
    }

    public LocalDateTime getGetTime() {
        return getTime;
    }

    public void setGetTime(LocalDateTime getTime) {
        this.getTime = getTime;
    }

    public LocalDateTime getUsingTime() {
        return usingTime;
    }

    public void setUsingTime(LocalDateTime usingTime) {
        this.usingTime = usingTime;
    }

    public LocalDateTime getUsedTime() {
        return usedTime;
    }

    public void setUsedTime(LocalDateTime usedTime) {
        this.usedTime = usedTime;
    }

    public LocalDateTime getExpireTime() {
        return expireTime;
    }

    public void setExpireTime(LocalDateTime expireTime) {
        this.expireTime = expireTime;
    }

    @Override
    public String toString() {
        return "CouponUse{" +
        "id=" + id +
        ", couponId=" + couponId +
        ", userId=" + userId +
        ", orderId=" + orderId +
        ", couponStatus=" + couponStatus +
        ", getTime=" + getTime +
        ", usingTime=" + usingTime +
        ", usedTime=" + usedTime +
        ", expireTime=" + expireTime +
        "}";
    }
}
