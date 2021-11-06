package com.bluecc.bluesrv.common;

import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;

@Data
public class BaseEntity implements Serializable {
    protected LocalDateTime lastUpdatedStamp;
    protected LocalDateTime createdStamp;
}
