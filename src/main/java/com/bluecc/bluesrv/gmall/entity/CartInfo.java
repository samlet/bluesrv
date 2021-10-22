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
 * 购物车表 用户登录系统时更新冗余
 * </p>
 *
 * @author samlet
 * @since 2021-10-23
 */
@TableName("cart_info")
@ApiModel(value = "CartInfo对象", description = "购物车表 用户登录系统时更新冗余")
public class CartInfo implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("编号")
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    @ApiModelProperty("用户id")
    private String userId;

    @ApiModelProperty("skuid")
    private Long skuId;

    @ApiModelProperty("放入购物车时价格")
    private BigDecimal cartPrice;

    @ApiModelProperty("数量")
    private Integer skuNum;

    @ApiModelProperty("图片文件")
    private String imgUrl;

    @ApiModelProperty("sku名称 (冗余)")
    private String skuName;

    private Integer isChecked;

    @ApiModelProperty("创建时间")
    private LocalDateTime createTime;

    @ApiModelProperty("修改时间")
    private LocalDateTime operateTime;

    @ApiModelProperty("是否已经下单")
    private Long isOrdered;

    @ApiModelProperty("下单时间")
    private LocalDateTime orderTime;

    @ApiModelProperty("来源类型")
    private String sourceType;

    @ApiModelProperty("来源编号")
    private Long sourceId;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public Long getSkuId() {
        return skuId;
    }

    public void setSkuId(Long skuId) {
        this.skuId = skuId;
    }

    public BigDecimal getCartPrice() {
        return cartPrice;
    }

    public void setCartPrice(BigDecimal cartPrice) {
        this.cartPrice = cartPrice;
    }

    public Integer getSkuNum() {
        return skuNum;
    }

    public void setSkuNum(Integer skuNum) {
        this.skuNum = skuNum;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public String getSkuName() {
        return skuName;
    }

    public void setSkuName(String skuName) {
        this.skuName = skuName;
    }

    public Integer getIsChecked() {
        return isChecked;
    }

    public void setIsChecked(Integer isChecked) {
        this.isChecked = isChecked;
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

    public Long getIsOrdered() {
        return isOrdered;
    }

    public void setIsOrdered(Long isOrdered) {
        this.isOrdered = isOrdered;
    }

    public LocalDateTime getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(LocalDateTime orderTime) {
        this.orderTime = orderTime;
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

    @Override
    public String toString() {
        return "CartInfo{" +
        "id=" + id +
        ", userId=" + userId +
        ", skuId=" + skuId +
        ", cartPrice=" + cartPrice +
        ", skuNum=" + skuNum +
        ", imgUrl=" + imgUrl +
        ", skuName=" + skuName +
        ", isChecked=" + isChecked +
        ", createTime=" + createTime +
        ", operateTime=" + operateTime +
        ", isOrdered=" + isOrdered +
        ", orderTime=" + orderTime +
        ", sourceType=" + sourceType +
        ", sourceId=" + sourceId +
        "}";
    }
}
