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
 * 退单表
 * </p>
 *
 * @author samlet
 * @since 2021-10-23
 */
@TableName("order_refund_info")
@ApiModel(value = "OrderRefundInfo对象", description = "退单表")
public class OrderRefundInfo implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("编号")
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    @ApiModelProperty("用户id")
    private Long userId;

    @ApiModelProperty("订单id")
    private Long orderId;

    @ApiModelProperty("skuid")
    private Long skuId;

    @ApiModelProperty("退款类型")
    private String refundType;

    @ApiModelProperty("退货件数")
    private Long refundNum;

    @ApiModelProperty("退款金额")
    private BigDecimal refundAmount;

    @ApiModelProperty("原因类型")
    private String refundReasonType;

    @ApiModelProperty("原因内容")
    private String refundReasonTxt;

    @ApiModelProperty("退款状态（0：待审批 1：已退款）")
    private String refundStatus;

    @ApiModelProperty("创建时间")
    private LocalDateTime createTime;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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

    public Long getSkuId() {
        return skuId;
    }

    public void setSkuId(Long skuId) {
        this.skuId = skuId;
    }

    public String getRefundType() {
        return refundType;
    }

    public void setRefundType(String refundType) {
        this.refundType = refundType;
    }

    public Long getRefundNum() {
        return refundNum;
    }

    public void setRefundNum(Long refundNum) {
        this.refundNum = refundNum;
    }

    public BigDecimal getRefundAmount() {
        return refundAmount;
    }

    public void setRefundAmount(BigDecimal refundAmount) {
        this.refundAmount = refundAmount;
    }

    public String getRefundReasonType() {
        return refundReasonType;
    }

    public void setRefundReasonType(String refundReasonType) {
        this.refundReasonType = refundReasonType;
    }

    public String getRefundReasonTxt() {
        return refundReasonTxt;
    }

    public void setRefundReasonTxt(String refundReasonTxt) {
        this.refundReasonTxt = refundReasonTxt;
    }

    public String getRefundStatus() {
        return refundStatus;
    }

    public void setRefundStatus(String refundStatus) {
        this.refundStatus = refundStatus;
    }

    public LocalDateTime getCreateTime() {
        return createTime;
    }

    public void setCreateTime(LocalDateTime createTime) {
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        return "OrderRefundInfo{" +
        "id=" + id +
        ", userId=" + userId +
        ", orderId=" + orderId +
        ", skuId=" + skuId +
        ", refundType=" + refundType +
        ", refundNum=" + refundNum +
        ", refundAmount=" + refundAmount +
        ", refundReasonType=" + refundReasonType +
        ", refundReasonTxt=" + refundReasonTxt +
        ", refundStatus=" + refundStatus +
        ", createTime=" + createTime +
        "}";
    }
}
