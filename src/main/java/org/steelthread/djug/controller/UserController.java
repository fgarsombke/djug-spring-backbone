package org.steelthread.djug.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.steelthread.djug.domain.User;

@Controller
@RequestMapping("/users")
public class UserController {

  private Map<String, User> users = new HashMap<String, User>();
  
  @RequestMapping(method = RequestMethod.POST, produces = "application/json", consumes = "application/json")
  @ResponseBody
  public User create(@RequestBody User user) {
    // set a unique ID
    user.setId(UUID.randomUUID().toString());
    // add to our in-memory collection of users
    users.put(user.getName(), user);
    return user;
  }
}
