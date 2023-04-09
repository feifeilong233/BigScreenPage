package com.qingfeng.framework.retry;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.retry.RetryCallback;
import org.springframework.retry.RetryContext;
import org.springframework.retry.listener.RetryListenerSupport;

/**
 * @author Administrator
 * @version 1.0.0
 * @ProjectName qingfeng
 * @Description TODO
 * @createTime 2022年04月28日 20:54:00
 */
public class AppRetryListenerSupport extends RetryListenerSupport {

    private static final Logger LOGGER = LoggerFactory.getLogger(AppRetryListenerSupport.class);


    @Override
    public <T, E extends Throwable> void close(RetryContext context, RetryCallback<T, E> callback, Throwable throwable) {
        LOGGER.info("The retry is closed.");
        System.out.println("The retry is closed.");
        super.close(context, callback, throwable);
    }

    @Override
    public <T, E extends Throwable> void onError(RetryContext context, RetryCallback<T, E> callback, Throwable throwable) {
        LOGGER.info("The retry is on error.");
        System.out.println("The retry is on error.");
        // 重试的时候如果需要处理一些其他逻辑，可以在该方法内增加
        super.onError(context, callback, throwable);
    }

    @Override
    public <T, E extends Throwable> boolean open(RetryContext context, RetryCallback<T, E> callback) {
        LOGGER.info("The retry is open.");
        System.out.println("The retry is open.");
        return super.open(context, callback);
    }
}