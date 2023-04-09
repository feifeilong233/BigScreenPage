package com.qingfeng;

import com.qingfeng.base.annotation.EnableMyProtect;
import com.qingfeng.base.annotation.EnableMyRedis;
import com.qingfeng.framework.retry.AppRetryListenerSupport;
import io.micrometer.core.instrument.MeterRegistry;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.actuate.autoconfigure.metrics.MeterRegistryCustomizer;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.context.annotation.Bean;
import org.springframework.retry.annotation.EnableRetry;
import org.springframework.retry.backoff.FixedBackOffPolicy;
import org.springframework.retry.policy.SimpleRetryPolicy;
import org.springframework.retry.support.RetryTemplate;

@EnableRetry
@SpringBootApplication
@MapperScan("com.qingfeng.*.mapper")
@EnableMyRedis
@EnableMyProtect
@ServletComponentScan
//@ServletComponentScan("com.qingfeng.framework.servlet")
public class QingfengApplication {

    @Value("${spring.application.name}")
    private  String application;

    public static void main(String[] args) {
        SpringApplication.run(QingfengApplication.class, args);
    }

    @Bean
    MeterRegistryCustomizer<MeterRegistry> configurer() {
        return (registry) -> registry.config().commonTags("application", application);
    }


    @Bean
    public RetryTemplate retryTemplate() {
        /**
         * The RetryPolicy determines when an operation should be retried.
         * A SimpleRetryPolicy is used to retry a fixed number of times. On the other hand, the BackOffPolicy is used to control backoff between retry attempts.
         * Finally, a FixedBackOffPolicy pauses for a fixed period of time before continuing.
         */
        RetryTemplate retryTemplate = new RetryTemplate();

        FixedBackOffPolicy fixedBackOffPolicy = new FixedBackOffPolicy();
        fixedBackOffPolicy.setBackOffPeriod(2000l);
        retryTemplate.setBackOffPolicy(fixedBackOffPolicy);
        SimpleRetryPolicy retryPolicy = new SimpleRetryPolicy();
        retryPolicy.setMaxAttempts(2);
        retryTemplate.setRetryPolicy(retryPolicy);
        retryTemplate.registerListener(new AppRetryListenerSupport());
        return retryTemplate;
    }


}
