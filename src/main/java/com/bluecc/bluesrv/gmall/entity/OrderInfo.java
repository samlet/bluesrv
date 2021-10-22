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
 * 订单表 订单表
 * </p>
 *
 * @author samlet
 * @since 2021-10-23
 */
@TableName("order_info")
@ApiModel(value = "OrderInfo对象", description = "订单表 订单表")
public class OrderInfo implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("编号")
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    @ApiModelProperty("收货人")
    private String consignee;

    @ApiModelProperty("收件人电话")
    private String consigneeTel;

    @ApiModelProperty("总金额")
    private BigDecimal totalAmount;

    @ApiModelProperty("订单状态")
    private String orderStatus;

    @ApiModelProperty("用户id")
    private Long userId;

    @ApiModelProperty("付款方式")
    private String paymentWay;

    @ApiModelProperty("送货地址")
    private String deliveryAddress;

    @ApiModelProperty("订单备注")
    private String orderComment;

    @ApiModelProperty("订单交易编号（第三方支付用)")
    private String outTradeNo;

    @ApiModelProperty("订单描述(第三方支付用)")
    private String tradeBody;

    @ApiModelProperty("创建时间")
    private LocalDateTime createTime;

    @ApiModelProperty("操作时间")
    private LocalDateTime operateTime;

    @ApiModelProperty("失效时间")
    private LocalDateTime expireTime;

    @ApiModelProperty("进度状态")
    private String processStatus;

    @ApiModelProperty("物流单编号")
    private String trackingNo;

    @ApiModelProperty("父订单编号")
    private Long parentOrderId;

    @ApiModelProperty("图片路径")
    private String imgUrl;

    @ApiModelProperty("地区")
    private Integer provinceId;

    @ApiModelProperty("促销金额")
    private BigDecimal activityReduceAmount;

    @ApiModelProperty("优惠券")
    private BigDecimal couponReduceAmount;

    @ApiModelProperty("原价金额")
    private BigDecimal originalTotalAmount;

    @ApiModelProperty("运费")
    private BigDecimal feightFee;

    @ApiModelProperty("运费减免")
    private BigDecimal feightFeeReduce;

    @ApiModelProperty("可退款日期（签收后30天）")
    private LocalDateTime refundableTime;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getConsignee() {
        return consignee;
    }

    public void setConsignee(String consignee) {
        this.consignee = consignee;
    }

    public String getConsigneeTel() {
        return consigneeTel;
    }

    public void setConsigneeTel(String consigneeTel) {
        this.consigneeTel = consigneeTel;
    }

    public BigDecimal getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(BigDecimal totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getPaymentWay() {
        return paymentWay;
    }

    public void setPaymentWay(String paymentWay) {
        this.paymentWay = paymentWay;
    }

    public String getDeliveryAddress() {
        return deliveryAddress;
    }

    public void setDeliveryAddress(String deliveryAddress) {
        this.deliveryAddress = deliveryAddress;
    }

    public String getOrderComment() {
        return orderComment;
    }

    public void setOrderComment(String orderComment) {
        this.orderComment = orderComment;
    }

    public String getOutTradeNo() {
        return outTradeNo;
    }

    public void setOutTradeNo(String outTradeNo) {
        this.outTradeNo = outTradeNo;
    }

    public String getTradeBody() {
        return tradeBody;
    }

    public void setTradeBody(String tradeBody) {
        this.tradeBody = tradeBody;
    }

    public LocalDateTime getCreateTime() {
        return createTime;
    }

    public void setCreateTime(LocalDateTime createTime) {
        this.createTime = createTime;
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

    public String getProcessStatus() {
        return processStatus;
    }

    public void setProcessStatus(String processStatus) {
        this.processStatus = processStatus;
    }

    public String getTrackingNo() {
        return trackingNo;
    }

    public void setTrackingNo(String trackingNo) {
        this.trackingNo = trackingNo;
    }

    public Long getParentOrderId() {
        return parentOrderId;
    }

    public void setParentOrderId(Long parentOrderId) {
        this.parentOrderId = parentOrderId;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public Integer getProvinceId() {
        return provinceId;
    }

    public void setProvinceId(Integer provinceId) {
        this.provinceId = provinceId;
    }

    public BigDecimal getActivityReduceAmount() {
        return activityReduceAmount;
    }

    public void setActivityReduceAmount(BigDecimal activityReduceAmount) {
        this.activityReduceAmount = activityReduceAmount;
    }

    public BigDecimal getCouponReduceAmount() {
        return couponReduceAmount;
    }

    public void setCouponReduceAmount(BigDecimal couponReduceAmount) {
        this.couponReduceAmount = couponReduceAmount;
    }

    public BigDecimal getOriginalTotalAmount() {
        return originalTotalAmount;
    }

    public void setOriginalTotalAmount(BigDecimal originalTotalAmount) {
        this.originalTotalAmount = originalTotalAmount;
    }

    public BigDecimal getFeightFee() {
        return feightFee;
    }

    public void setFeightFee(BigDecimal feightFee) {
        this.feightFee = feightFee;
    }

    public BigDecimal getFeightFeeReduce() {
        return feightFeeReduce;
    }

    public void setFeightFeeReduce(BigDecimal feightFeeReduce) {
        this.feightFeeReduce = feightFeeReduce;
    }

    public LocalDateTime getRefundableTime() {
        return refundableTime;
    }

    public void setRefundableTime(LocalDateTime refundableTime) {
        this.refundableTime = refundableTime;
    }

    @Override
    public String toString() {
        return "OrderInfo{" +
        "id=" + id +
        ", consignee=" + consignee +
        ", consigneeTel=" + consigneeTel +
        ", totalAmount=" + totalAmount +
        ", orderStatus=" + orderStatus +
        ", userId=" + userId +
        ", paymentWay=" + paymentWay +
        ", deliveryAddress=" + deliveryAddress +
        ", orderComment=" + orderComment +
        ", outTradeNo=" + outTradeNo +
        ", tradeBody=" + tradeBody +
        ", createTime=" + createTime +
        ", operateTime=" + operateTime +
        ", expireTime=" + expireTime +
        ", processStatus=" + processStatus +
        ", trackingNo=" + trackingNo +
        ", parentOrderId=" + parentOrderId +
        ", imgUrl=" + imgUrl +
        ", provinceId=" + provinceId +
        ", activityReduceAmount=" + activityReduceAmount +
        ", couponReduceAmount=" + couponReduceAmount +
        ", originalTotalAmount=" + originalTotalAmount +
        ", feightFee=" + feightFee +
        ", feightFeeReduce=" + feightFeeReduce +
        ", refundableTime=" + refundableTime +
        "}";
    }
}
