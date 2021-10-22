package com.bluecc.bluesrv.gmall.entity;

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
@TableName("financial_sku_cost")
@ApiModel(value = "FinancialSkuCost对象", description = "")
public class FinancialSkuCost implements Serializable {

    private static final long serialVersionUID = 1L;

    private String id;

    @ApiModelProperty("sku_id")
    private Long skuId;

    @ApiModelProperty("商品名称")
    private String skuName;

    @ApiModelProperty("业务日期")
    private String busiDate;

    @ApiModelProperty("是否最近")
    private String isLastest;

    @ApiModelProperty("商品结算成本")
    private BigDecimal skuCost;

    @ApiModelProperty("创建时间")
    private LocalDateTime createTime;


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
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

    public String getBusiDate() {
        return busiDate;
    }

    public void setBusiDate(String busiDate) {
        this.busiDate = busiDate;
    }

    public String getIsLastest() {
        return isLastest;
    }

    public void setIsLastest(String isLastest) {
        this.isLastest = isLastest;
    }

    public BigDecimal getSkuCost() {
        return skuCost;
    }

    public void setSkuCost(BigDecimal skuCost) {
        this.skuCost = skuCost;
    }

    public LocalDateTime getCreateTime() {
        return createTime;
    }

    public void setCreateTime(LocalDateTime createTime) {
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        return "FinancialSkuCost{" +
        "id=" + id +
        ", skuId=" + skuId +
        ", skuName=" + skuName +
        ", busiDate=" + busiDate +
        ", isLastest=" + isLastest +
        ", skuCost=" + skuCost +
        ", createTime=" + createTime +
        "}";
    }
}
