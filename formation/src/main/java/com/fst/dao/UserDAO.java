package com.fst.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.fst.entity.User;

@Repository
public interface UserDAO extends JpaRepository<User, Long> {

	User findByUsername(String username);
	
	@Query(value ="select id from User where roles=:roles ", nativeQuery = true )
	List<Long> findByRoles(String roles);
	
	@Query(value="select i.id from User i where roles=:roles and i.id=:id", nativeQuery = true)
	Long getInstructorById(@Param("id") Long id, @Param("roles") String roles);
	
	@Query(value="select e.id from User e where roles=:roles and e.id=:id", nativeQuery = true)
	Long getStudentById(@Param("id") Long id, @Param("roles") String roles);
}
