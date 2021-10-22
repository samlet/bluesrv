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
 * 支付信息表
 * </p>
 *
 * @author samlet
 * @since 2021-10-23
 */
@TableName("payment_info")
@ApiModel(value = "PaymentInfo对象", description = "支付信息表")
public class PaymentInfo implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("编号")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty("对外业务编号")
    private String outTradeNo;

    @ApiModelProperty("订单编号")
    private Long orderId;

    private Long userId;

    @ApiModelProperty("支付类型（微信 支付宝）")
    private String paymentType;

    @ApiModelProperty("交易编号")
    private String tradeNo;

    @ApiModelProperty("支付金额")
    private BigDecimal totalAmount;

    @ApiModelProperty("交易内容")
    private String subject;

    @ApiModelProperty("支付状态")
    private String paymentStatus;

    @ApiModelProperty("创建时间")
    private LocalDateTime createTime;

    @ApiModelProperty("回调时间")
    private LocalDateTime callbackTime;

    @ApiModelProperty("回调信息")
    private String callbackContent;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOutTradeNo() {
        return outTradeNo;
    }

    public void setOutTradeNo(String outTradeNo) {
        this.outTradeNo = outTradeNo;
    }

    public Long getOrderId() {
        return orderId;
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(String paymentType) {
        this.paymentType = paymentType;
    }

    public String getTradeNo() {
        return tradeNo;
    }

    public void setTradeNo(String tradeNo) {
        this.tradeNo = tradeNo;
    }

    public BigDecimal getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(BigDecimal totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(String paymentStatus) {
        this.paymentStatus = paymentStatus;
    }

    public LocalDateTime getCreateTime() {
        return createTime;
    }

    public void setCreateTime(LocalDateTime createTime) {
        this.createTime = createTime;
    }

    public LocalDateTime getCallbackTime() {
        return callbackTime;
    }

    public void setCallbackTime(LocalDateTime callbackTime) {
        this.callbackTime = callbackTime;
    }

    public String getCallbackContent() {
        return callbackContent;
    }

    public void setCallbackContent(String callbackContent) {
        this.callbackContent = callbackContent;
    }

    @Override
    public String toString() {
        return "PaymentInfo{" +
        "id=" + id +
        ", outTradeNo=" + outTradeNo +
        ", orderId=" + orderId +
        ", userId=" + userId +
        ", paymentType=" + paymentType +
        ", tradeNo=" + tradeNo +
        ", totalAmount=" + totalAmount +
        ", subject=" + subject +
        ", paymentStatus=" + paymentStatus +
        ", createTime=" + createTime +
        ", callbackTime=" + callbackTime +
        ", callbackContent=" + callbackContent +
        "}";
    }
}
