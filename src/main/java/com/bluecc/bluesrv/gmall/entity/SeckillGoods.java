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
 * 
 * </p>
 *
 * @author samlet
 * @since 2021-10-23
 */
@TableName("seckill_goods")
@ApiModel(value = "SeckillGoods对象", description = "")
public class SeckillGoods implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    @ApiModelProperty("spu_id")
    private Long spuId;

    @ApiModelProperty("sku_id")
    private Long skuId;

    @ApiModelProperty("标题")
    private String skuName;

    @ApiModelProperty("商品图片")
    private String skuDefaultImg;

    @ApiModelProperty("原价格")
    private BigDecimal price;

    @ApiModelProperty("秒杀价格")
    private BigDecimal costPrice;

    @ApiModelProperty("添加日期")
    private LocalDateTime createTime;

    @ApiModelProperty("审核日期")
    private LocalDateTime checkTime;

    @ApiModelProperty("审核状态")
    private String status;

    @ApiModelProperty("开始时间")
    private LocalDateTime startTime;

    @ApiModelProperty("结束时间")
    private LocalDateTime endTime;

    @ApiModelProperty("秒杀商品数")
    private Integer num;

    @ApiModelProperty("剩余库存数")
    private Integer stockCount;

    @ApiModelProperty("描述")
    private String skuDesc;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getSpuId() {
        return spuId;
    }

    public void setSpuId(Long spuId) {
        this.spuId = spuId;
    }

    public Long getSkuId() {
        return skuId;
    }

    public void setSkuId(Long skuId) {
        this.skuId = skuId;
    }

    public String getSkuName() {
        return skuName;
    }

    public void setSkuName(String skuName) {
        this.skuName = skuName;
    }

    public String getSkuDefaultImg() {
        return skuDefaultImg;
    }

    public void setSkuDefaultImg(String skuDefaultImg) {
        this.skuDefaultImg = skuDefaultImg;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public BigDecimal getCostPrice() {
        return costPrice;
    }

    public void setCostPrice(BigDecimal costPrice) {
        this.costPrice = costPrice;
    }

    public LocalDateTime getCreateTime() {
        return createTime;
    }

    public void setCreateTime(LocalDateTime createTime) {
        this.createTime = createTime;
    }

    public LocalDateTime getCheckTime() {
        return checkTime;
    }

    public void setCheckTime(LocalDateTime checkTime) {
        this.checkTime = checkTime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
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

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public Integer getStockCount() {
        return stockCount;
    }

    public void setStockCount(Integer stockCount) {
        this.stockCount = stockCount;
    }

    public String getSkuDesc() {
        return skuDesc;
    }

    public void setSkuDesc(String skuDesc) {
        this.skuDesc = skuDesc;
    }

    @Override
    public String toString() {
        return "SeckillGoods{" +
        "id=" + id +
        ", spuId=" + spuId +
        ", skuId=" + skuId +
        ", skuName=" + skuName +
        ", skuDefaultImg=" + skuDefaultImg +
        ", price=" + price +
        ", costPrice=" + costPrice +
        ", createTime=" + createTime +
        ", checkTime=" + checkTime +
        ", status=" + status +
        ", startTime=" + startTime +
        ", endTime=" + endTime +
        ", num=" + num +
        ", stockCount=" + stockCount +
        ", skuDesc=" + skuDesc +
        "}";
    }
}
