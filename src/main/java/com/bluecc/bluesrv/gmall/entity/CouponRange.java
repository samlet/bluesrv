package com.bluecc.bluesrv.gmall.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * <p>
 * 优惠券范围表
 * </p>
 *
 * @author samlet
 * @since 2021-10-23
 */
@TableName("coupon_range")
@ApiModel(value = "CouponRange对象", description = "优惠券范围表")
public class CouponRange implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("购物券编号")
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    @ApiModelProperty("优惠券id")
    private Long couponId;

    @ApiModelProperty("范围类型 1、商品(spuid) 2、品类(三级分类id) 3、品牌")
    private String rangeType;

    private Long rangeId;


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

    public String getRangeType() {
        return rangeType;
    }

    public void setRangeType(String rangeType) {
        this.rangeType = rangeType;
    }

    public Long getRangeId() {
        return rangeId;
    }

    public void setRangeId(Long rangeId) {
        this.rangeId = rangeId;
    }

    @Override
    public String toString() {
        return "CouponRange{" +
        "id=" + id +
        ", couponId=" + couponId +
        ", rangeType=" + rangeType +
        ", rangeId=" + rangeId +
        "}";
    }
}
