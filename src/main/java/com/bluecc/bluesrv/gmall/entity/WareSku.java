package com.bluecc.bluesrv.gmall.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * <p>
 * sku与仓库关联表
 * </p>
 *
 * @author samlet
 * @since 2021-10-23
 */
@TableName("ware_sku")
@ApiModel(value = "WareSku对象", description = "sku与仓库关联表")
public class WareSku implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("编号")
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    @ApiModelProperty("skuid")
    private Long skuId;

    @ApiModelProperty("仓库id")
    private Long warehouseId;

    @ApiModelProperty("库存数")
    private Integer stock;

    @ApiModelProperty("存货名称")
    private String stockName;

    @ApiModelProperty("锁定库存数")
    private Integer stockLocked;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getSkuId() {
        return skuId;
    }

    public void setSkuId(Long skuId) {
        this.skuId = skuId;
    }

    public Long getWarehouseId() {
        return warehouseId;
    }

    public void setWarehouseId(Long warehouseId) {
        this.warehouseId = warehouseId;
    }

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }

    public String getStockName() {
        return stockName;
    }

    public void setStockName(String stockName) {
        this.stockName = stockName;
    }

    public Integer getStockLocked() {
        return stockLocked;
    }

    public void setStockLocked(Integer stockLocked) {
        this.stockLocked = stockLocked;
    }

    @Override
    public String toString() {
        return "WareSku{" +
        "id=" + id +
        ", skuId=" + skuId +
        ", warehouseId=" + warehouseId +
        ", stock=" + stock +
        ", stockName=" + stockName +
        ", stockLocked=" + stockLocked +
        "}";
    }
}
