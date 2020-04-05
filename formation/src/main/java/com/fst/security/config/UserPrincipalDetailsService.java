package com.fst.security.config;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.fst.dao.UserDAO;
import com.fst.entity.User;

@Service
public class UserPrincipalDetailsService implements UserDetailsService {
    private UserDAO userDAO;

    public UserPrincipalDetailsService(UserDAO userDAO) {
        this.userDAO = userDAO;
    }


    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = this.userDAO.findByUsername(username);
        if (user == null) {
            throw new UsernameNotFoundException("No user found for "+ username + ".");
          }

        UserPrincipal userPrincipal = new UserPrincipal(user);
        return userPrincipal;
    }
}