package org.steelthread.djug.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.steelthread.djug.domain.User;

@Controller
@RequestMapping("/users")
public class UserController {

  private Map<String, User> users = new HashMap<String, User>();

  @RequestMapping(method = RequestMethod.GET, produces = "application/json")
  @ResponseBody
  public List<User> findAllUsers() {
    List<User> userList = new ArrayList<User>();
    for (Map.Entry<String, User> entry : users.entrySet()) {
      userList.add(entry.getValue());
    }
    return userList; 
  }
  
  @RequestMapping(method = RequestMethod.POST, produces = "application/json", consumes = "application/json")
  @ResponseBody
  public User create(@RequestBody User user) {
    // set a unique ID
    user.setId(UUID.randomUUID().toString());
    // add to our in-memory collection of users
    users.put(user.getId(), user);
    return user;
  }
  
  @RequestMapping(value="{id}", method = RequestMethod.DELETE)
  @ResponseStatus(HttpStatus.OK)
  public void delete(@PathVariable("id") String id) {
    users.remove(id);
  }  
}