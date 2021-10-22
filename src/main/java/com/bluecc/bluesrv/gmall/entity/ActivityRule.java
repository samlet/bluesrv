package com.bluecc.bluesrv.gmall.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.math.BigDecimal;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * <p>
 * 优惠规则
 * </p>
 *
 * @author samlet
 * @since 2021-10-23
 */
@TableName("activity_rule")
@ApiModel(value = "ActivityRule对象", description = "优惠规则")
public class ActivityRule implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("编号")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty("类型")
    private Integer activityId;

    @ApiModelProperty("活动类型")
    private String activityType;

    @ApiModelProperty("满减金额")
    private BigDecimal conditionAmount;

    @ApiModelProperty("满减件数")
    private Long conditionNum;

    @ApiModelProperty("优惠金额")
    private BigDecimal benefitAmount;

    @ApiModelProperty("优惠折扣")
    private BigDecimal benefitDiscount;

    @ApiModelProperty("优惠级别")
    private Long benefitLevel;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getActivityId() {
        return activityId;
    }

    public void setActivityId(Integer activityId) {
        this.activityId = activityId;
    }

    public String getActivityType() {
        return activityType;
    }

    public void setActivityType(String activityType) {
        this.activityType = activityType;
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

    public Long getBenefitLevel() {
        return benefitLevel;
    }

    public void setBenefitLevel(Long benefitLevel) {
        this.benefitLevel = benefitLevel;
    }

    @Override
    public String toString() {
        return "ActivityRule{" +
        "id=" + id +
        ", activityId=" + activityId +
        ", activityType=" + activityType +
        ", conditionAmount=" + conditionAmount +
        ", conditionNum=" + conditionNum +
        ", benefitAmount=" + benefitAmount +
        ", benefitDiscount=" + benefitDiscount +
        ", benefitLevel=" + benefitLevel +
        "}";
    }
}
