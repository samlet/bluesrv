package com.bluecc.bluesrv.gmall.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * <p>
 * 二级分类表
 * </p>
 *
 * @author samlet
 * @since 2021-10-23
 */
@TableName("base_category2")
@ApiModel(value = "BaseCategory2对象", description = "二级分类表")
public class BaseCategory2 implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("编号")
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    @ApiModelProperty("二级分类名称")
    private String name;

    @ApiModelProperty("一级分类编号")
    private Long category1Id;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Long getCategory1Id() {
        return category1Id;
    }

    public void setCategory1Id(Long category1Id) {
        this.category1Id = category1Id;
    }

    @Override
    public String toString() {
        return "BaseCategory2{" +
        "id=" + id +
        ", name=" + name +
        ", category1Id=" + category1Id +
        "}";
    }
}
