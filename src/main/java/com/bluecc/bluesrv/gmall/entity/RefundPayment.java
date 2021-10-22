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
 * 退款信息表
 * </p>
 *
 * @author samlet
 * @since 2021-10-23
 */
@TableName("refund_payment")
@ApiModel(value = "RefundPayment对象", description = "退款信息表")
public class RefundPayment implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("编号")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty("对外业务编号")
    private String outTradeNo;

    @ApiModelProperty("订单编号")
    private Long orderId;

    private Long skuId;

    @ApiModelProperty("支付类型（微信 支付宝）")
    private String paymentType;

    @ApiModelProperty("交易编号")
    private String tradeNo;

    @ApiModelProperty("退款金额")
    private BigDecimal totalAmount;

    @ApiModelProperty("交易内容")
    private String subject;

    @ApiModelProperty("退款状态")
    private String refundStatus;

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

    public Long getSkuId() {
        return skuId;
    }

    public void setSkuId(Long skuId) {
        this.skuId = skuId;
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
        return "RefundPayment{" +
        "id=" + id +
        ", outTradeNo=" + outTradeNo +
        ", orderId=" + orderId +
        ", skuId=" + skuId +
        ", paymentType=" + paymentType +
        ", tradeNo=" + tradeNo +
        ", totalAmount=" + totalAmount +
        ", subject=" + subject +
        ", refundStatus=" + refundStatus +
        ", createTime=" + createTime +
        ", callbackTime=" + callbackTime +
        ", callbackContent=" + callbackContent +
        "}";
    }
}
