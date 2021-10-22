package com.bluecc.bluesrv.gmall.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * <p>
 * 三级分类表
 * </p>
 *
 * @author samlet
 * @since 2021-10-23
 */
@TableName("base_category3")
@ApiModel(value = "BaseCategory3对象", description = "三级分类表")
public class BaseCategory3 implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("编号")
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    @ApiModelProperty("三级分类名称")
    private String name;

    @ApiModelProperty("二级分类编号")
    private Long category2Id;


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

    public Long getCategory2Id() {
        return category2Id;
    }

    public void setCategory2Id(Long category2Id) {
        this.category2Id = category2Id;
    }

    @Override
    public String toString() {
        return "BaseCategory3{" +
        "id=" + id +
        ", name=" + name +
        ", category2Id=" + category2Id +
        "}";
    }
}
