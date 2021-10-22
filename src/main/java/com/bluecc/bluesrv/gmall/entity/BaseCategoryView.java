package com.bluecc.bluesrv.gmall.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * <p>
 * VIEW
 * </p>
 *
 * @author samlet
 * @since 2021-10-23
 */
@TableName("base_category_view")
@ApiModel(value = "BaseCategoryView对象", description = "VIEW")
public class BaseCategoryView implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("编号")
    private Long id;

    @ApiModelProperty("编号")
    private Long category1Id;

    @ApiModelProperty("分类名称")
    private String category1Name;

    @ApiModelProperty("编号")
    private Long category2Id;

    @ApiModelProperty("二级分类名称")
    private String category2Name;

    @ApiModelProperty("编号")
    private Long category3Id;

    @ApiModelProperty("三级分类名称")
    private String category3Name;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getCategory1Id() {
        return category1Id;
    }

    public void setCategory1Id(Long category1Id) {
        this.category1Id = category1Id;
    }

    public String getCategory1Name() {
        return category1Name;
    }

    public void setCategory1Name(String category1Name) {
        this.category1Name = category1Name;
    }

    public Long getCategory2Id() {
        return category2Id;
    }

    public void setCategory2Id(Long category2Id) {
        this.category2Id = category2Id;
    }

    public String getCategory2Name() {
        return category2Name;
    }

    public void setCategory2Name(String category2Name) {
        this.category2Name = category2Name;
    }

    public Long getCategory3Id() {
        return category3Id;
    }

    public void setCategory3Id(Long category3Id) {
        this.category3Id = category3Id;
    }

    public String getCategory3Name() {
        return category3Name;
    }

    public void setCategory3Name(String category3Name) {
        this.category3Name = category3Name;
    }

    @Override
    public String toString() {
        return "BaseCategoryView{" +
        "id=" + id +
        ", category1Id=" + category1Id +
        ", category1Name=" + category1Name +
        ", category2Id=" + category2Id +
        ", category2Name=" + category2Name +
        ", category3Id=" + category3Id +
        ", category3Name=" + category3Name +
        "}";
    }
}
