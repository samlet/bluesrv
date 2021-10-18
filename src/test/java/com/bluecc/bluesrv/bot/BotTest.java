package com.bluecc.bluesrv.bot;

import com.baomidou.dynamic.datasource.annotation.DS;
import com.bluecc.bluesrv.bot.entity.Users;
import com.bluecc.bluesrv.bot.mapper.UsersMapper;
import com.bluecc.bluesrv.foo.bean.User;
import com.bluecc.bluesrv.foo.mapper.UserMapper;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

@SpringBootTest
public class BotTest {

    @Autowired
    private UsersMapper usersMapper;

    @Test
    public void testSelect() {
        System.out.println(("----- selectAll method test ------"));
        List<Users> userList = usersMapper.selectList(null);
        assertTrue(userList.size()>1);
        userList.forEach(System.out::println);
    }

}