package com.bluecc.bluesrv.gmall.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * <p>
 * 属性表
 * </p>
 *
 * @author samlet
 * @since 2021-10-23
 */
@TableName("base_attr_info")
@ApiModel(value = "BaseAttrInfo对象", description = "属性表")
public class BaseAttrInfo implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("编号")
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    @ApiModelProperty("属性名称")
    private String attrName;

    @ApiModelProperty("分类id")
    private Long categoryId;

    @ApiModelProperty("分类层级")
    private Integer categoryLevel;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getAttrName() {
        return attrName;
    }

    public void setAttrName(String attrName) {
        this.attrName = attrName;
    }

    public Long getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Long categoryId) {
        this.categoryId = categoryId;
    }

    public Integer getCategoryLevel() {
        return categoryLevel;
    }

    public void setCategoryLevel(Integer categoryLevel) {
        this.categoryLevel = categoryLevel;
    }

    @Override
    public String toString() {
        return "BaseAttrInfo{" +
        "id=" + id +
        ", attrName=" + attrName +
        ", categoryId=" + categoryId +
        ", categoryLevel=" + categoryLevel +
        "}";
    }
}
