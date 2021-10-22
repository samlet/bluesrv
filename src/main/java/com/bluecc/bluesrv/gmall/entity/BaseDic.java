package com.bluecc.bluesrv.gmall.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
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
@TableName("base_dic")
@ApiModel(value = "BaseDic对象", description = "")
public class BaseDic implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("编号")
    private String id;

    @ApiModelProperty("编码名称")
    private String dicName;

    @ApiModelProperty("父编号")
    private String parentCode;

    @ApiModelProperty("创建日期")
    private LocalDateTime createTime;

    @ApiModelProperty("修改日期")
    private LocalDateTime operateTime;


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getDicName() {
        return dicName;
    }

    public void setDicName(String dicName) {
        this.dicName = dicName;
    }

    public String getParentCode() {
        return parentCode;
    }

    public void setParentCode(String parentCode) {
        this.parentCode = parentCode;
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

    @Override
    public String toString() {
        return "BaseDic{" +
        "id=" + id +
        ", dicName=" + dicName +
        ", parentCode=" + parentCode +
        ", createTime=" + createTime +
        ", operateTime=" + operateTime +
        "}";
    }
}
