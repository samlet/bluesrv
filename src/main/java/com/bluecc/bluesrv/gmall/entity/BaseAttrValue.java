package com.bluecc.bluesrv.gmall.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * <p>
 * 属性值表
 * </p>
 *
 * @author samlet
 * @since 2021-10-23
 */
@TableName("base_attr_value")
@ApiModel(value = "BaseAttrValue对象", description = "属性值表")
public class BaseAttrValue implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("编号")
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    @ApiModelProperty("属性值名称")
    private String valueName;

    @ApiModelProperty("属性id")
    private Long attrId;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getValueName() {
        return valueName;
    }

    public void setValueName(String valueName) {
        this.valueName = valueName;
    }

    public Long getAttrId() {
        return attrId;
    }

    public void setAttrId(Long attrId) {
        this.attrId = attrId;
    }

    @Override
    public String toString() {
        return "BaseAttrValue{" +
        "id=" + id +
        ", valueName=" + valueName +
        ", attrId=" + attrId +
        "}";
    }
}
