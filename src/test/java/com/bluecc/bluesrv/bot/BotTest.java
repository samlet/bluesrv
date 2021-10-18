package com.bluecc.bluesrv.bot;

import com.baomidou.dynamic.datasource.annotation.DS;
import com.bluecc.bluesrv.bot.entity.Users;
import com.bluecc.bluesrv.bot.mapper.UsersMapper;
import com.bluecc.bluesrv.bot.service.IUsersService;
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
    @Autowired
    private IUsersService usersService;

    @Test
    public void testSelect() {
        System.out.println(("----- selectAll method test ------"));
        List<Users> userList = usersMapper.selectList(null);
        assertTrue(userList.size()>1);
        userList.forEach(System.out::println);
    }

    @Test
    void testSelectId(){
        Users user=usersMapper.selectById(1);
        System.out.println(user);
    }

    @Test
    void testUsersService(){
        Users user=usersService.getById(1);
        System.out.println(user);

        Users newUser=new Users();
        newUser.setName("foo");
        newUser.setFullname("foo bar");
        usersService.save(newUser);
    }

    @Test
    void testUserUpdate(){
        usersService.update().eq("name", "foo").remove();
    }
}

