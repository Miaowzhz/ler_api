package com.ler.lercommon.service;

import com.ler.lercommon.model.entity.User;


/**
 * 用户服务
 *
 * @author ler
 */
public interface InnerUserService {

    /**
     * 从数据库中查询是否已经分配给用户密钥（accessKey、secretKey）
     * @param accessKey
     * @return
     */
    User getInvokeUser(String accessKey);
}
