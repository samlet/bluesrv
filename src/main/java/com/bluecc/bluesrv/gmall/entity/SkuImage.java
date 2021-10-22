package com.bluecc.bluesrv.gmall.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * <p>
 * 库存单元图片表
 * </p>
 *
 * @author samlet
 * @since 2021-10-23
 */
@TableName("sku_image")
@ApiModel(value = "SkuImage对象", description = "库存单元图片表")
public class SkuImage implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("编号")
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    @ApiModelProperty("商品id")
    private Long skuId;

    @ApiModelProperty("图片名称（冗余）")
    private String imgName;

    @ApiModelProperty("图片路径(冗余)")
    private String imgUrl;

    @ApiModelProperty("商品图片id")
    private Long spuImgId;

    @ApiModelProperty("是否默认")
    private String isDefault;


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

    public String getImgName() {
        return imgName;
    }

    public void setImgName(String imgName) {
        this.imgName = imgName;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public Long getSpuImgId() {
        return spuImgId;
    }

    public void setSpuImgId(Long spuImgId) {
        this.spuImgId = spuImgId;
    }

    public String getIsDefault() {
        return isDefault;
    }

    public void setIsDefault(String isDefault) {
        this.isDefault = isDefault;
    }

    @Override
    public String toString() {
        return "SkuImage{" +
        "id=" + id +
        ", skuId=" + skuId +
        ", imgName=" + imgName +
        ", imgUrl=" + imgUrl +
        ", spuImgId=" + spuImgId +
        ", isDefault=" + isDefault +
        "}";
    }
}
