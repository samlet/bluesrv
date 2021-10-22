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
 * 优惠券表
 * </p>
 *
 * @author samlet
 * @since 2021-10-23
 */
@TableName("coupon_info")
@ApiModel(value = "CouponInfo对象", description = "优惠券表")
public class CouponInfo implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("购物券编号")
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    @ApiModelProperty("购物券名称")
    private String couponName;

    @ApiModelProperty("购物券类型 1 现金券 2 折扣券 3 满减券 4 满件打折券")
    private String couponType;

    @ApiModelProperty("满额数（3）")
    private BigDecimal conditionAmount;

    @ApiModelProperty("满件数（4）")
    private Long conditionNum;

    @ApiModelProperty("活动编号")
    private Long activityId;

    @ApiModelProperty("减金额（1 3）")
    private BigDecimal benefitAmount;

    @ApiModelProperty("折扣（2 4）")
    private BigDecimal benefitDiscount;

    @ApiModelProperty("创建时间")
    private LocalDateTime createTime;

    @ApiModelProperty("范围类型 1、商品(spuid) 2、品类(三级分类id) 3、品牌")
    private String rangeType;

    @ApiModelProperty("最多领用次数")
    private Integer limitNum;

    @ApiModelProperty("已领用次数")
    private Integer takenCount;

    @ApiModelProperty("可以领取的开始日期")
    private LocalDateTime startTime;

    @ApiModelProperty("可以领取的结束日期")
    private LocalDateTime endTime;

    @ApiModelProperty("修改时间")
    private LocalDateTime operateTime;

    @ApiModelProperty("过期时间")
    private LocalDateTime expireTime;

    @ApiModelProperty("范围描述")
    private String rangeDesc;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCouponName() {
        return couponName;
    }

    public void setCouponName(String couponName) {
        this.couponName = couponName;
    }

    public String getCouponType() {
        return couponType;
    }

    public void setCouponType(String couponType) {
        this.couponType = couponType;
    }

    public BigDecimal getConditionAmount() {
        return conditionAmount;
    }

    public void setConditionAmount(BigDecimal conditionAmount) {
        this.conditionAmount = conditionAmount;
    }

    public Long getConditionNum() {
        return conditionNum;
    }

    public void setConditionNum(Long conditionNum) {
        this.conditionNum = conditionNum;
    }

    public Long getActivityId() {
        return activityId;
    }

    public void setActivityId(Long activityId) {
        this.activityId = activityId;
    }

    public BigDecimal getBenefitAmount() {
        return benefitAmount;
    }

    public void setBenefitAmount(BigDecimal benefitAmount) {
        this.benefitAmount = benefitAmount;
    }

    public BigDecimal getBenefitDiscount() {
        return benefitDiscount;
    }

    public void setBenefitDiscount(BigDecimal benefitDiscount) {
        this.benefitDiscount = benefitDiscount;
    }

    public LocalDateTime getCreateTime() {
        return createTime;
    }

    public void setCreateTime(LocalDateTime createTime) {
        this.createTime = createTime;
    }

    public String getRangeType() {
        return rangeType;
    }

    public void setRangeType(String rangeType) {
        this.rangeType = rangeType;
    }

    public Integer getLimitNum() {
        return limitNum;
    }

    public void setLimitNum(Integer limitNum) {
        this.limitNum = limitNum;
    }

    public Integer getTakenCount() {
        return takenCount;
    }

    public void setTakenCount(Integer takenCount) {
        this.takenCount = takenCount;
    }

    public LocalDateTime getStartTime() {
        return startTime;
    }

    public void setStartTime(LocalDateTime startTime) {
        this.startTime = startTime;
    }

    public LocalDateTime getEndTime() {
        return endTime;
    }

    public void setEndTime(LocalDateTime endTime) {
        this.endTime = endTime;
    }

    public LocalDateTime getOperateTime() {
        return operateTime;
    }

    public void setOperateTime(LocalDateTime operateTime) {
        this.operateTime = operateTime;
    }

    public LocalDateTime getExpireTime() {
        return expireTime;
    }

    public void setExpireTime(LocalDateTime expireTime) {
        this.expireTime = expireTime;
    }

    public String getRangeDesc() {
        return rangeDesc;
    }

    public void setRangeDesc(String rangeDesc) {
        this.rangeDesc = rangeDesc;
    }

    @Override
    public String toString() {
        return "CouponInfo{" +
        "id=" + id +
        ", couponName=" + couponName +
        ", couponType=" + couponType +
        ", conditionAmount=" + conditionAmount +
        ", conditionNum=" + conditionNum +
        ", activityId=" + activityId +
        ", benefitAmount=" + benefitAmount +
        ", benefitDiscount=" + benefitDiscount +
        ", createTime=" + createTime +
        ", rangeType=" + rangeType +
        ", limitNum=" + limitNum +
        ", takenCount=" + takenCount +
        ", startTime=" + startTime +
        ", endTime=" + endTime +
        ", operateTime=" + operateTime +
        ", expireTime=" + expireTime +
        ", rangeDesc=" + rangeDesc +
        "}";
    }
}
