package com.qingfeng.common.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.math.BigDecimal;

@Data
@TableName("road_structure")
public class RoadStructure {
    /**
     * 主键id
     */
    @TableId(value = "id", type = IdType.INPUT)
    private String id;

    /**
     * 路面层次名称
     */
    @TableField("name")
    private String name;

    /**
     * 路面层次厚度
     */
    @TableField("value")
    private BigDecimal value;

    /**
     * 所属路面id
     */
    @TableField("pid")
    private String pid;

    /**
     * 所属路面名称
     */
    @TableField("pid_name")
    private String pid_name;
}
