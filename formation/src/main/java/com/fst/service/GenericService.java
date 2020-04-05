package com.fst.service;

import java.util.List;

public interface GenericService<T, K> {
	
	T save(T t);
	T update(T t);
	void delete(T t);
	T getById(K k);
	List<T> getAll();

}