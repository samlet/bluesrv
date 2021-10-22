package com.bluecc.bluesrv.gmall.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * <p>
 * 前端数据保护表
 * </p>
 *
 * @author samlet
 * @since 2021-10-23
 */
@TableName("base_frontend_param")
@ApiModel(value = "BaseFrontendParam对象", description = "前端数据保护表")
public class BaseFrontendParam implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("编号")
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    @ApiModelProperty("属性名称")
    private String code;

    @ApiModelProperty("分类id")
    private Long deleteId;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Long getDeleteId() {
        return deleteId;
    }

    public void setDeleteId(Long deleteId) {
        this.deleteId = deleteId;
    }

    @Override
    public String toString() {
        return "BaseFrontendParam{" +
        "id=" + id +
        ", code=" + code +
        ", deleteId=" + deleteId +
        "}";
    }
}
