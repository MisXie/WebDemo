package com.xie;

import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Controller;

/**
 * @author xieyongjing
 */
@Controller
@CacheConfig(cacheNames = "cacheTest")
public class CacheTest {

  @Cacheable(value = "myCache", key = "targetClass+#p0")
  public String getValue(String u){
    System.out.println("save");
    u = u + Math.random();
    return u;
  }

  //根据key删除数据
  @CacheEvict(value = "myCache" , key = "targetClass+#p0")
  public void clearCache(String u){
    System.out.println("clearCache..");
  }

  //value 定义命名空间优先级大于@CacheConfig配置的，
  @CachePut(value = "cacheTest",key = "targetClass+#p0")
  public String updateValue(String u){
    System.out.println("update");
    u = u + Math.random();
    return u;
  }



}
