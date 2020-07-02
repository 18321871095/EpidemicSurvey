package com.chinasofti.util;

import redis.clients.jedis.JedisPool;

public class RedisPool {
    private static JedisPool jedisPool;
    private static Integer maxTotal;
    private static Integer maxIdel;
    private static Integer minIdel;
    private static boolean testOnBorrow;
    private static boolean testOnReturn;
}
