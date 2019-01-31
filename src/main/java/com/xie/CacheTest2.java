package com.xie;

import org.springframework.cache.Cache;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Controller;

/**
 * @author xieyongjing
 */
@Controller
@CacheConfig(cacheNames = {"cha"})
public class CacheTest2 {

  @Cacheable(key = "methodName")
  public String getValue(String u){
    System.out.println("entry..");
    u = u + Math.random();
    return u;
  }
}
